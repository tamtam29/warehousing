class CreateBarangKeluarCategories < ActiveRecord::Migration
  def change
    create_table :barang_keluar_categories do |t|
      t.string :code
      t.string :name
      t.timestamps null: false
    end
  end
end
