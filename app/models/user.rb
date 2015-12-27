class User < ActiveRecord::Base
	
  has_many :posts, :dependent => :destroy, :foreign_key => "user_id"
  belongs_to :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Localisation de l'utilisateur
  geocoded_by :adresse
  after_validation :geocode

  # Membres en ligne
  scope :online, -> { where("last_ping_at > ?", 10.minutes.ago) }
  # Trie les pseudos de a -> z en downant la casse
  scope :sort_pseudo_user, -> {order("lower(pseudo) asc")}
  # Selectionne les utilisateurs par leur langage
  scope :langage_ruby, -> { select { |user| user.langage == "Ruby" }}
  scope :langage_js, -> { select { |user| user.langage == "Javascript" }}
  scope :langage_php, -> { select { |user| user.langage == "Php" }}

  has_attached_file :avatar, styles: {
    medium: "200x200>",
    thumb: "25x25",
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
