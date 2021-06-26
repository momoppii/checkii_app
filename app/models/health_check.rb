class HealthCheck < ApplicationRecord
  belongs_to :user
  validates :templature, presence: true
  validates :respiratory_symptom, :throat_nasus_eyes_symptom, :digestive_symptom, :other, :memo, length: { maximum: 255 }
end