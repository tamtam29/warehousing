class Barang < ActiveRecord::Base
  belongs_to :category
  belongs_to :unit
  has_one :promo

  validates :code, :name, uniqueness: true, presence: true
  validates :category_id, :unit_id, :harga, presence: true

  has_attached_file :gambar_barang,
  :styles => { :medium => "300x300>", :thumb => "100x100>" },
  :default_url => "/assets/missing.jpg",
  :path => ":rails_root/public/system/gambar_barangs/:attachment/:id/:style/:filename",
  :url => "/system/gambar_barangs/:attachment/:id/:style/:filename"

  validates_attachment_content_type :gambar_barang, :content_type => %w(image/jpeg image/jpg image/png)
end
