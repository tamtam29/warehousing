class Category < ActiveRecord::Base
  has_many :barangs, :dependent => :destroy
  validates :code, :name, uniqueness: true, presence: true
end
