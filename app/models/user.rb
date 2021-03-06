class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :belong, length: { maximum: 20 }
  validates :vaccine, presence: true, length: { maximum: 5 }
  has_secure_password
  
  has_many :health_checks
  has_many :activity_logs
end