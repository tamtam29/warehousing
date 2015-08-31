class CreateDetailBarangKeluars < ActiveRecord::Migration
  def change
    create_table :detail_barang_keluars do |t|
      t.references :barang_keluar, index: true
      t.references :barang_keluar_barang, index: true
      t.integer :jumlah, :default => 0
      t.decimal :total_harga_awal, :default => 0, precision: 13, scale: 2
      t.decimal :total_harga, :default => 0, precision: 13, scale: 2
      t.decimal :pre_order, :default => 0, precision: 13, scale: 2

      t.timestamps null: false
    end
  end
end
