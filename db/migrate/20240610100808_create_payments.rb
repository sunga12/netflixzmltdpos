class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.string :paymentmethod
      t.decimal :amount, :precision => 10, :scale => 2
      t.date :date

      t.timestamps
    end
  end
end
