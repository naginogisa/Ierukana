class Word < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  acts_as_taggable
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
