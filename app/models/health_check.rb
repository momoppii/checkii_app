class HealthCheck < ApplicationRecord
  belongs_to :user
  validates :templature, presence: true, numericality: { in: 30..50 }
  validates :respiratory_symptom, :throat_nasus_eyes_symptom, :digestive_symptom, :other, :memo, length: { maximum: 255 }
end