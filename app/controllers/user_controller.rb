class UserController < ApplicationController
  
  #before_action :authenticate_owner!
  before_filter :set_user, only: [:show, :edit, :update]

	def index
    @users = User.all
    # ?? Utilités ??
    #@users = User.order('created_at DESC').paginate(page: params[:page], per_page: 30)
	end

  def show
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
      params.require(:user).permit(:nom, :pseudo, :tagline, :introduction, :avatar)
    end

    # def authenticate_owner!
    #   redirect_to root_path unless user_signed_in? && current_user.to_param == params[:id]
    # end


end
