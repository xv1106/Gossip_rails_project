class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :email
      t.integer :age

      if table_exists?(:cities)  # Vérifie si la table cities existe
        t.references :city, foreign_key: true
      else
        t.integer :city_id  # Si la table cities n'existe pas, crée une colonne city_id de type integer
      end

      t.timestamps
    end
  end
end

