class HealthCheck < ApplicationRecord
  belongs_to :user
  validates :templature, presence: true, numericality:  { greater_than_or_equal_to: 30, less_than_or_equal_to: 40 }
  validates :respiratory_symptom, :throat_nasus_eyes_symptom, :digestive_symptom, :other, :memo, length: { maximum: 255 }
end