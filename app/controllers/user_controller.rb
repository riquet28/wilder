class UserController < ApplicationController
	has_many :posts


	def index
		@user = User.all
	end




end
