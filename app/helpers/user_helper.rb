module UserHelper

	# Affichage pseudo si existe sinon email
  def pseudo_mail(user)
		if user.pseudo != ""
      user.pseudo
		else
			user.email
		end
	end

  # Affichage du logo selon langage
  def logo(langage)
    if langage == "Ruby"
      image_tag("rails.png", class: 'img-responsive')
    elsif langage == "Php"
      image_tag("php.png", class: 'img-responsive')
    elsif langage == "Javascript"
      image_tag("javascript.png", class: 'img-responsive')
    else
      image_tag("nolangage.jpg", class: 'img-responsive')
    end
  end

end
