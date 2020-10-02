class Want < ApplicationRecord
  belongs_to :user
  has_many :cheers, dependent: :destroy
  validates :name, presence: true, length: {maximum: 15}
  validates :price, numericality: { only_integer: true }
  validates :reason, length: {maximum: 15}
  attachment :want_image, content_type: ["image/jpeg", "image/png"]

  def cheered_by?(user)
    cheers.where(user_id: user.id).exists?
  end
end
