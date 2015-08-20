class BarangKeluar < ActiveRecord::Base
  has_many :detail_barang_keluars, :dependent => :delete_all
  accepts_nested_attributes_for :detail_barang_keluars, allow_destroy: true

  def self.generate_no_transaksi
    transaksi = BarangKeluar.where("no_transaksi like '%#{Date.today.strftime("%Y%m")}%'").order("no_transaksi DESC").first
    if transaksi
      last_number = transaksi.no_transaksi.split('BK')
      number = last_number[1].to_i + 1
    else
      number = Date.today.strftime("%Y%m").to_s+1.to_s.rjust(4, '0')
    end
    "BK"+number.to_s
  end
end
