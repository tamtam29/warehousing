class BarangMasuk < ActiveRecord::Base
  belongs_to :barang

  validates :no_transaksi, uniqueness: true, presence: true
  validates :tgl_masuk, presence: true
  validates :jumlah, numericality: { only_integer: true, greater_than_or_equal_to: 1 }


  def self.generate_no_transaksi
    transaksi = BarangMasuk.where("no_transaksi like '%#{Date.today.strftime("%Y%m")}%'").order("no_transaksi DESC").first
    if transaksi
      last_number = transaksi.no_transaksi.split('BM')
      number = last_number[1].to_i + 1
    else
      number = Date.today.strftime("%Y%m").to_s+1.to_s.rjust(4, '0')
    end
    "BM"+number.to_s
  end
end
