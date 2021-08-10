class ActivityLog < ApplicationRecord
  belongs_to :user
  validates :log, presence: true, length: { maximum: 255 }
  def self.serach(search)
    if search
      ActivityLog.where(['log LIKE?', "%#{search}%"])
    else
      ActivityLog.all
    end
  end
end