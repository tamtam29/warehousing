class Category < ActiveRecord::Base
  has_many :barangs, :dependent => :destroy
end
