class Barang < ActiveRecord::Base
  belongs_to :category
  belongs_to :unit
  has_one :promo

  validates :code, :name, uniqueness: true, presence: true
  validates :category_id, :unit_id, :harga, presence: true
end
