# frozen_string_literal: true

class ScoresController < AppController
  # before_action :authenticate_user!
  respond_to :js

  def update
    @score = Score.find(params[:id]).update_attributes(score: params[:score])
  end

  def generate_random
    tournament = Tournament.find(params[:tournament_id])
    RandomScoresGenerator.call(tournament)
  end
end
