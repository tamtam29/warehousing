class Stock < ActiveRecord::Base
  belongs_to :barang
  validates :barang_id, uniqueness: true, presence: true
end
