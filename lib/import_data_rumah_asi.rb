module ImportDataRumahAsi
  require 'csv'

  def import_category
    csv_file_path=Rails.root.join('lib','assets','rumah_asi.csv')
    CSV.foreach(csv_file_path, headers: true) do |row|
      p = Category.create({
            :name => row[6]
          })
    end
  end

  def import_barang
    csv_file_path=Rails.root.join('lib','assets','rumah_asi.csv')
    CSV.foreach(csv_file_path, headers: true) do |row|
      p = Barang.create({
            :category_id => Category.find_by(name: row[6]).id,
            :unit_id => 1,
            :code => row[0],
            :name => row[1],
            :harga => row[5]
          })
      z = BarangMasuk.create({
            :barang_id => p.id,
            :no_transaksi => generate_no_transaksi_bm,
            :jumlah => row[3],
            :tgl_masuk => DateTime.now.strftime("%Y-%m-%d")
          })
      y = Stock.create({
          :barang_id => p.id,
          :jumlah => row[3]
          })
    end
  end

  def generate_no_transaksi_bm
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