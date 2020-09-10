class Waste < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: {maximum: 15}
  validates :price, numericality: { only_integer: true }

end
