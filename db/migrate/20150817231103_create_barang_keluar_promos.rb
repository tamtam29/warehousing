class CreateBarangKeluarPromos < ActiveRecord::Migration
  def change
    create_table :barang_keluar_promos do |t|
      t.references :barang_keluar_barang, index: true
      t.string :name
      t.string :description
      t.integer :threshold_qty, :default => 0
      t.decimal :disc, :default => 0, precision: 13, scale: 2
      t.timestamps null: false
    end
  end
end
