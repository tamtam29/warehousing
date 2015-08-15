class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :barang, index: true
      t.integer :jumlah, :default => 0

      t.timestamps null: false
    end
  end
end
