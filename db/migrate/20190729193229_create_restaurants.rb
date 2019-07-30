class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :phone_number
      t.integer :rating
      t.string :review
      t.string :description
      t.string :img_url
      t.references :cuisine, foreign_key: true
      t.timestamps
    end
  end
end
