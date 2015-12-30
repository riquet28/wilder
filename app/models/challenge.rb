class Challenge < ActiveRecord::Base

  has_many :participations
  has_many :users, through: :participations

  paginates_per 5

  scope :expired, -> { where("expires_at < ? ", Time.now) }
  scope :running, -> { where("expires_at >= ? ", Time.now) }

  scope :high_points, -> { where("points >= ? ", 50) }
  
end
