class CreateCuisines < ActiveRecord::Migration[5.2]
  def change
    create_table :cuisines do |t|
      t.string :name
      t.string :img_url

      t.timestamps
    end
  end
end
