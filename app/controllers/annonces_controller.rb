class AnnoncesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] #koulchi ila index et show ##c'est a dire que ces action index et show seulement qui peut etre executer sans avoir besoin d'executer la methode helper  authenticate_user 
  before_action :set_annonce, only: [:show, :edit, :update, :destroy]# ghir show et edit updat destroy ##Alorsque only   veut dire que set_annonce serra executer avant show et edit update destroy 
  before_action :check_owner, only: [:edit, :update, :destroy] #on check si celui le proprietere 
#NORMALMENT J'AI FAIT RAILS GENERATE SCAFOLD ANNONCE QUI M A CREER TOUS CES LES CONTROLLEUR ET VUES  AVEC LES DEFINITIONS ET J AI AJOUTE SUEELEMNET CURRENCT USER 
  def index # index affiche tous les annonces tries par la date de creation 
    @annonces = Annonce.all.order(created_at: :desc)  #all : tous  order : triées
  end

  def show
  end

  def new #current_user : est une instance de la  Classe User.rb definies dans model  ou annonces c'est une attribut dans la cette class 
    @annonce = current_user.annonces.build #current_user :devise creer une sesion lorsque l'user est authentifie  et stocke l'id de cette session dans current_user    
    @hide_navbar = true #build est une methode predefinie dans la Classe de controleur  ActiveRecord que tous les controlleru herite de cului la 
  end
  

  def create  #j ai pas utilise create 
    @annonce = current_user.annonces.build(annonce_params)
    
    if @annonce.save
      redirect_to @annonce, notice: 'Annonce créée avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @hide_navbar = true
  end
=begin
#on a automatiquement l'id est connue  de l'annonce et connu et envoye a view edit.html.erb
Voici comment cela fonctionne derrière les coulisses :

ruby
Copier
Modifier
def edit
  @annonce = Annonce.find(params[:id])  
end
Rails charge l'annonce correspondante à l'ID donné dans les paramètres et la met dans @annonce.
=end
  def update   #j'ai pas l'utilise dans la vue 
    if @annonce.update(annonce_params)
      redirect_to @annonce, notice: 'Annonce mise à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @annonce.destroy
    redirect_to mes_annonces_annonces_path, notice: 'Annonce supprimée avec succès.'
  end

  def mes_annonces
    @annonces = current_user.annonces.order(created_at: :desc)
  end


  def search
    @query = params[:query]
    @categorie = params[:categorie]
    @ville = params[:ville]
    
    # Commencez avec toutes les annonces
    @annonces = Annonce.all
    
    # Filtrez par titre si un query est fourni
    @annonces = @annonces.where("titre LIKE ?", "%#{@query}%") if @query.present?
    
    # Filtrez par catégorie si sélectionnée
    @annonces = @annonces.where(categorie: @categorie) if @categorie.present?
    
    # Filtrez par ville si sélectionnée
    @annonces = @annonces.where(ville: @ville) if @ville.present?
    
    # Ordonnez par date de création, du plus récent au plus ancien
    @annonces = @annonces.order(created_at: :desc)
    
    render :search_results
  end

  private #methode prive creer par scaffold automatiquement 

  def set_annonce
    @annonce = Annonce.find(params[:id])
  end

  def check_owner
    unless @annonce.user == current_user
      redirect_to annonces_path, alert: "Vous n'êtes pas autorisé à effectuer cette action."
    end
  end

  def annonce_params 
    params.require(:annonce).permit(
    :titre, 
    :description, 
    :prix, 
    :categorie, 
    :ville, 
    :image
  )
  end
end
#Mass-assignment est une vulnérabilité courante dans les applications web qui ne filtrent pas correctement les
# paramètres. Utiliser params.require().permit() est une manière de protéger ton application contre ce type d'attaque.