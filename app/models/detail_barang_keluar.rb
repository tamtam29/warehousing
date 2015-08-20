class DetailBarangKeluar < ActiveRecord::Base
  belongs_to :barang_keluar
  belongs_to :barang_keluar_barang
end
