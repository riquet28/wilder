module UserHelper

	def connecte(current_user)
		if current_user
			"Connecté"
		else
			"Hors-ligne"
		end
	end

end
