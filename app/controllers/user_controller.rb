class UserController < ApplicationController
  before_action :authenticate_user!
  before_filter :set_user, only: [:show, :edit, :update]

	def index
    @titre = "La Promo"
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.pseudo
    end
	end

  def show
    @titre = "Mon Profil"
    @user = User.find(params[:id])
    @challenges = @user.challenges
    @participations_user = @user.participations
    @todo_lists = TodoList.all
  end

  def create
    @user = User.create(user_params)
  end

  def edit
    @user.build_profile if @user.profile.nil?
  end

  def update
    if @user.update(user_params)
      redirect_to user_profile_path(@user)
    else
      render 'edit'
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:nom, :prenom, :pseudo, :introduction, :adresse, :avatar, :latitude, :longitude)
    end


end
