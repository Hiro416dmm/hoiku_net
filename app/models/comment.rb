class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :daycare
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
end
