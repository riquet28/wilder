class User < ActiveRecord::Base
	
  has_many :posts, :dependent => :destroy, :foreign_key => "user_id"
  belongs_to :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Membres en ligne
  scope :online, -> { where("last_ping_at > ?", 10.minutes.ago) }

  has_attached_file :avatar, styles: {
    medium: "200x200>",
    thumb: "40x40>",
    thumb1: "50x50>" 
  }, 
    default_url: "/images/:style/missing.jpg" 
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # Mailboxer functionality
  acts_as_messageable

  def mailboxer_email(object)
    email
  end
  
end
