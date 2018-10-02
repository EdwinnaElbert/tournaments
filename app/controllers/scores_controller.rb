# frozen_string_literal: true

class ScoresController < AppController
  before_action :authenticate_user!

  def create
    if params[:team_id].present?
      @score = Score.find_or_create_by(team_id: params[:team_id], match_id: params[:match_id], score: params[:score])
    else
      tournament = Tournament.find(params[:tournament_id])
      GenerateScoresService.call(tournament)
    end
    redirect_to tournament_path(@tournament)
  end

  def update

  end
end
