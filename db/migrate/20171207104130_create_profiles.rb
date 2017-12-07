class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.boolean :gender
      t.string :birthday
      t.string :phone
      t.string :location
      t.string :bio

      t.timestamps
    end
  end
end
