class CreateAdoptionRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :adoption_requests do |t|
      t.string :name
      t.string :pet
      t.text :letter_of_intent
      t.string :contactno
      t.string :email

      t.timestamps
    end
  end
end
