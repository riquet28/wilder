module ApplicationHelper

  # Affiche automatiquement le nom de la page courante
  def titre
    base_titre = "Projet Wilder"
    if @titre.nil?
      base_titre
    else
      "#{base_titre} | #{@titre}"
    end
  end

  # En attente si utilisation ou non de gravatar
  # def gravatar_for(user, size = 30, title = user.nom)
  #   image_tag gravatar_image_url(user.email, size: size), title: title, class: 'img-rounded'
  # end

  # Affiche si l'utilisateur est en ligne ou hors-ligne
  def en_ligne(current_user)
    @online_users = User.online
    if @online_users.include?(current_user)
      content_tag( :i, nil, class: 'fa fa-circle circle-online pull-right' )
    else
      content_tag( :i, nil, class: 'fa fa-circle-o circle-offline pull-right' )
    end
  end

  # Affiche le nombre de posts "postés" par l'utilisateur
  # Dans un helper ou un model ? Un scope ?
  def nb_posts_user(current_user)
    current_user.posts.count
  end

  # Affiche le nombre d'offres partagées par l'utilisateur
  # Dans un helper ou un model ? Un scope ?
  def nb_offres_user(current_user)
    current_user.offres.count
  end

  # def nb_votes_like(current_user)
    
  # end
end
