class CreateBarangKeluarPreOrders < ActiveRecord::Migration
  def change
    create_table :barang_keluar_pre_orders do |t|
      t.references :barang_keluar, index: true
      t.decimal :nominal, :default => 0, precision: 13, scale: 2
      t.datetime :pre_order_date

      t.timestamps null: false
    end
  end
end
