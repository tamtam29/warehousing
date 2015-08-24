class Promo < ActiveRecord::Base
  belongs_to :barang
  validates :barang_id, uniqueness: true, presence: true
  validates :name, :disc, :threshold_qty, presence: true
end
