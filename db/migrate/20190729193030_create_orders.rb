class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      # t.references :user, foreign_key: true
      t.boolean :status
      t.integer :total_price

      t.timestamps
    end
  end
end
