class ActivityLog < ApplicationRecord
  belongs_to :user
  validates :log, presence: true, length: { maximum: 255 }
end