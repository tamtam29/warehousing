class CreateBarangKeluars < ActiveRecord::Migration
  def change
    create_table :barang_keluars do |t|
      t.string :no_transaksi
      t.datetime :tgl_keluar
      t.decimal :grand_total, :default => 0, precision: 13, scale: 2
      t.decimal :pre_order, :default => 0, precision: 13, scale: 2
      t.decimal :bayar, :default => 0, precision: 13, scale: 2
      t.decimal :kembalian, :default => 0, precision: 13, scale: 2
      t.string :payment_type
      t.string :state

      t.timestamps null: false
    end
  end
end
