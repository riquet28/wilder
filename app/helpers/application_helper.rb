module ApplicationHelper

  def titre
    base_titre = "Projet Wilder"
    if @titre.nil?
      base_titre
    else
      "#{base_titre} | #{@titre}"
    end
  end

  def gravatar_for(user, size = 30, title = user.nom)
    image_tag gravatar_image_url(user.email, size: size), title: title, class: 'img-rounded'
  end

  def en_ligne(current_user)
    @online_users = User.online
    if @online_users.include?(current_user)
      "En ligne"
    else
      "Hors-ligne"
    end
  end

end
