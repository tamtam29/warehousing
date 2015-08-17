class Promo < ActiveRecord::Base
  belongs_to :barang
  validates :barang_id, :name, :disc, :threshold_qty, presence: true
end
