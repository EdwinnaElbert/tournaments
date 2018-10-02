# frozen_string_literal: true

class ScoresController < AppController
  before_action :authenticate_user!

  def update
    @score = Score.find(params[:id]).update_attributes(score: params[:score])
  end

  def generate_random
    binding.pry
    tournament = Tournament.find(params[:tournament_id])
    GenerateRandomScoresService.call(tournament)
    # redirect_to tournament_path(tournament.id)
  end
end
