class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
	
  # Acts_as_vatable
  acts_as_voter

  has_many :posts, :dependent => :destroy, :foreign_key => "user_id"
  has_many :offres
  has_many :participations, :dependent => :destroy, :foreign_key => "user_id"
  has_many :challenges, through: :participations
  has_many :challenges
  
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

  # Mailboxer functionality
  acts_as_messageable

  def mailboxer_email(object)
    email
  end
  

end
