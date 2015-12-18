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
      content_tag( :i, nil, class: 'fa fa-circle circle-online pull-right' )
    else
      content_tag( :i, nil, class: 'fa fa-circle-o circle-offline pull-right' )
    end
  end

end
