class Want < ApplicationRecord
  belongs_to :user
  has_many :cheers
end
