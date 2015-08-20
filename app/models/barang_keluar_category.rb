class BarangKeluarCategory < ActiveRecord::Base
  has_many :barang_keluar_barangs, :dependent => :destroy
end
