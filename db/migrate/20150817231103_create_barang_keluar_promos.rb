class CreateBarangKeluarPromos < ActiveRecord::Migration
  def change
    create_table :barang_keluar_promos do |t|
      t.references :barang_keluar_barang, index: true
      t.string :name
      t.string :description
      t.integer :threshold_qty
      t.float :disc, :default => 0
      t.timestamps null: false
    end
  end
end
