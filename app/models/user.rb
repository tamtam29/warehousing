class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
         # :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true
  validates :username, uniqueness: true, presence: true

  def self.role_list
    %w(Admin User)
  end
end
