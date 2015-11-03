module UserHelper

	def connecte(current_user)
		if user_signed_in?
			"Connecté"
		else
			"Hors-ligne"
		end
	end

end
