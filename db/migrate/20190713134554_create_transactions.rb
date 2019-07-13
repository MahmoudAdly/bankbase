class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :sender_id, index: true, null: false
      t.integer :receiver_id, index: true, null: false
      t.string :source_currency, null: false
      t.string :target_currency, null: false
      t.decimal :amount, precision: 15, scale: 2, null: false
      t.decimal :exchange_rate, precision: 15, scale: 5, null: false
      t.string :status, index: true, null: false
      t.timestamps
    end

    add_foreign_key :transactions, :users, column: :sender_id
    add_foreign_key :transactions, :users, column: :receiver_id
  end
end
