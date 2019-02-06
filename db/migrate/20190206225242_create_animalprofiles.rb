class CreateAnimalprofiles < ActiveRecord::Migration[5.2]
  def change
    create_table :animalprofiles do |t|
      t.integer :animalID
      t.integer :profileID
      t.string :name
      t.string :species
      t.string :gender
      t.string :color
      t.text :markings
      t.string :location
      t.string :neutered
      t.string :vaccinated
      t.string :adopted
      t.text :remarks
      t.string :cagelabel

      t.timestamps
    end
  end
end
