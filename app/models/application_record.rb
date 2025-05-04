class ApplicationRecord < ActiveRecord::Base  #ActiveRecord::Base est la classe de base pour tous les models qui interagisse avec la base de donner pour acceder a une serie de fonctionnallite comem active record User.all 
  primary_abstract_class

=begin
Le rôle de primary_abstract_class est de signaler à Rails qu'une classe est abstraite 
et qu'elle ne doit pas être associée à une table dans la base de données. 
Il empêche également Rails de générer des migrations ou de créer des tables pour cette classe.
=end
end
