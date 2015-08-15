class CreateBarangMasuks < ActiveRecord::Migration
  def change
    create_table :barang_masuks do |t|
      t.references :barang, index: true
      t.string :no_transaksi
      t.integer :jumlah, :default => 0
      t.date :tgl_masuk
      t.text :note

      t.timestamps null: false
    end
  end
end
