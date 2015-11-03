class UserController < ApplicationController
	has_many :posts


	def index
		@users = User.all
	end




end
