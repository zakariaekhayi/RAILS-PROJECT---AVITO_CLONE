class AnnoncesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_annonce, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def index
    @annonces = Annonce.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @annonce = current_user.annonces.build
    @hide_navbar = true
  end
  

  def create
    @annonce = current_user.annonces.build(annonce_params)
    
    if @annonce.save
      redirect_to @annonce, notice: 'Annonce créée avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
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

  private

  def set_annonce
    @annonce = Annonce.find(params[:id])
  end

  def check_owner
    unless @annonce.user == current_user
      redirect_to annonces_path, alert: "Vous n'êtes pas autorisé à effectuer cette action."
    end
  end

  def annonce_params
    params.require(:annonce).permit(:titre, :description, :prix, :categorie, :ville, :image)
  end
end