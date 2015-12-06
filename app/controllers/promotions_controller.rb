class PromotionsController < ApplicationController
  
  def index
    @titre = "Promotion"
    @users = User.all
  end

  def show
    @titre = "Promotion"
  end

end
