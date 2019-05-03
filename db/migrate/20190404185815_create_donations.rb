class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.string :name
      t.string :method
      t.float :amount
      t.text :notes

      t.timestamps
    end
  end
end
