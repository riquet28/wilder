module PostsHelper

	def creation_post(dateHeure)
		dateHeure.created_at.strftime("%I:%M")
	end

end
