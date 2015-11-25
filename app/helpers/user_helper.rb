module UserHelper

	# Fonctionne pas
  def pseudo_mail(user)
		if user.pseudo != nil
			user.pseudo
		else
			user.email
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
