class OffresController < ApplicationController

  before_action :authenticate_user!
  before_action :set_offre, only: [:show, :edit, :update, :destroy]

  def index
    @offres = Offre.all
    @titre = "Emplois/Stages"
    @lastoffre = Offre.last(3)
    @users = User.all
  end

  def show
  end

  def new
    @offre = Offre.new
  end

  def edit
  end

  def create
    @offre = Offre.new(offre_params)
    if @offre.save
      flash[:success] = 'Votre offre a bien été crée.'
      redirect_to offres_path
    else
      flash[:danger] = 'Il y a eu un problème à la création de votre offre.'
      format.html { render :new }
    end
  end

  def update
    respond_to do |format|
      if @offre.update(offre_params)
        flash[:success] = 'Votre offre a bien été mise à jour.'
        format.html { redirect_to @offre, notice: 'Post was successfully updated.' }
      else
        flash[:danger] = 'There was a problem updating the Post.'
        format.html { render :edit }
      end
    end
  end

  def destroy
    @offre.destroy
    respond_to do |format|
      flash[:success] = 'Supprimée avec succès.'
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offre
      @offre = Offre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offre_params
      params.require(:offre).permit(:user_id, :url, :language)
    end

end
