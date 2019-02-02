class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  has_many :likes, as: :likeable, dependent: :destroy
  validates :micropost_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
