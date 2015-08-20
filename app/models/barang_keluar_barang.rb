class BarangKeluarBarang < ActiveRecord::Base
  belongs_to :barang_keluar_category
  belongs_to :unit
  has_one :barang_keluar_promo
end
