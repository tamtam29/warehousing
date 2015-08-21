class Category < ActiveRecord::Base
  has_many :barangs, :dependent => :destroy
  validates :name, uniqueness: true, presence: true
end
