class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :wants
  has_many :wastes

  # def self.waste_sum_price
  #   @user = current_user
  #   self.wastes.price * @user.wastes.count
  # end

end
