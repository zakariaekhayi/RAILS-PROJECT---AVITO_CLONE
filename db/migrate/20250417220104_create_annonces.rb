class CreateAnnonces < ActiveRecord::Migration[7.0]
  def change
    create_table :annonces do |t|
      t.string :titre, null: false
      t.text :description
      t.decimal :prix, precision: 10, scale: 2
      t.string :categorie
      t.string :ville
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :annonces, :titre
    add_index :annonces, :categorie
    add_index :annonces, :ville
  end
end