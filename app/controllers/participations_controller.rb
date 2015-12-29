class ParticipationsController < ApplicationController

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @participation = @challenge.participations.new(participation_params)
    if @participation.save
      redirect_to @participation.challenge, notice: 'Participation was successfully updated'
    else
      render text: "Error"
    end
  end

  private

  def participation_params
    params.require(:participation).permit(:user_name, :message)
  end

end