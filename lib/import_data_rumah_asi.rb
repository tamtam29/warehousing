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
    end
  end
end