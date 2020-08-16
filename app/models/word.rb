class Word < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  acts_as_taggable
  belongs_to :user
  has_many :comments, dependent: :destroy
end
