class BarangKeluarPreOrder < ActiveRecord::Base
  belongs_to :barang_keluar
  validates :barang_keluar_id, uniqueness: true, presence: true
end
