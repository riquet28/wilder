class Participation < ActiveRecord::Base

  belongs_to :challenge
  belongs_to :user

  validates :challenge_id, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true

  after_create :give_points_to_user

  def give_points_to_user
    user.points += challenge.points
    user.save
  end

end
