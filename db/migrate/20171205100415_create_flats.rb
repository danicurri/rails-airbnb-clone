class CreateFlats < ActiveRecord::Migration[5.0]
  def change
    create_table :flats do |t|
      t.string :address
      t.string :description
      t.string :title
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
