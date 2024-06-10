class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :category
      t.decimal :price, :precision => 10, :scale => 2
      t.string :sku
      t.integer :stocklevel
      t.integer :reorderlevel

      t.timestamps
    end
  end
end
