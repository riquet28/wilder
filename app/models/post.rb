class Post < ActiveRecord::Base
	belongs_to :user 
	validates_presence_of :content
  acts_as_votable
end
