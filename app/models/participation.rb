class Participation < ActiveRecord::Base

  belongs_to :challenge
  belongs_to :user

  validates :challenge_id, presence: true
  validates :user_id, presence: true

end
