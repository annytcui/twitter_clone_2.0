class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true
  validates :user_id, presence: true
  validates :likeable_id, presence: true
  validates :likeable_type, presence: true
  validates :likeable_id, uniqueness: { scope: [:user_id, :likeable_type] }
end
