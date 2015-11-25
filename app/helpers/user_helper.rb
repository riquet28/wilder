module UserHelper

	# Fonctionne pas
  def connecte(current_user)
		if user_signed_in?
			"Connecté"
		else
			"Hors-ligne"
		end
	end

  # Affichage du logo selon langage
  def logo(langage)
    if langage == "Ruby"
      image_tag("rails.png")
    elsif langage == "Php"
      image_tag("php.png")
    else
      image_tag("javascript.png")
    end
  end

end
