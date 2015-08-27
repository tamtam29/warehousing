class CreateBarangKeluars < ActiveRecord::Migration
  def change
    create_table :barang_keluars do |t|
      t.string :no_transaksi
      t.datetime :tgl_keluar
      t.float :grand_total, :default => 0
      t.float :bayar, :default => 0
      t.float :kembalian, :default => 0

      t.timestamps null: false
    end
  end
end
