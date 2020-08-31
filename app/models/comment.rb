class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :word

  validates :comment, presence: true
end
