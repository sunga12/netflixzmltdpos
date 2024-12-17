class CreateStockItems < ActiveRecord::Migration[7.1]
  def change
    create_table :stock_items do |t|
      t.references :product, null: false, foreign_key: true
      t.string :changetype
      t.integer :quantitychange
      t.integer :newstocklevel
      t.timestamp :changedate

      t.timestamps
    end
  end
end
