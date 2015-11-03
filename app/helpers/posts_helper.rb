module PostsHelper

	def creation_post(dateHeure)
		dateHeure.created_at.strftime(("%d/%m/%Y à %H:%M"))
	end

end
