class CreateBarangs < ActiveRecord::Migration
  def change
    create_table :barangs do |t|
      t.references :category, index: true
      t.references :unit, index: true
      t.string :code
      t.string :name
      t.text :description
      t.decimal :harga, :default => 0, precision: 13, scale: 2
      t.decimal :min_bayar_po, :default => 0, precision: 13, scale: 2

      t.timestamps null: false
    end
  end
end
