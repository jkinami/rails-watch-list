class Review < ApplicationRecord
  belongs_to :list
  validates :comment, presence: true
end
