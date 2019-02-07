class CreateViewprofiles < ActiveRecord::Migration[5.2]
  def change
    create_table :viewprofiles do |t|

      t.timestamps
    end
  end
end
