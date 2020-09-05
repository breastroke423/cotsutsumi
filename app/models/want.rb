class Want < ApplicationRecord
  belongs_to :user
  has_many :cheers, dependent: :destroy

  def cheered_by?(user)
    cheers.where(user_id: user.id).exists?
  end
  attachment :want_image
end
