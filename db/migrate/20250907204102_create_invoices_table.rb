class CreateInvoicesTable < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices do |t|
      t.integer :reservation_id, null: false
      t.integer :nights_subtotal, null: false
      t.integer :services_subtotal, null: false
      t.integer :tax, null: false
      t.integer :total, null: false
      t.datetime :issued_at, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
