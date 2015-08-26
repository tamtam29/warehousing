class AddAttachmentGambarBarangToBarangs < ActiveRecord::Migration
  def self.up
    change_table :barangs do |t|
      t.attachment :gambar_barang
    end
  end

  def self.down
    drop_attached_file :barangs, :gambar_barang
  end
end
