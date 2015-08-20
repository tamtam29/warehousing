class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.references :barang, index: true
      t.string :name
      t.string :description
      t.integer :threshold_qty
      t.float :disc

      t.timestamps null: false
    end
  end
end
