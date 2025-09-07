class CreateServiceUsagesTable < ActiveRecord::Migration[8.0]
  def change
    create_table :service_usages do |t|
      t.integer :reservation_id, null: false
      t.integer :service_id, null: false
      t.integer :quantity, null: false
      t.datetime :used_at, null: false
      t.text :note, null: false

      t.timestamps
    end
  end
end
