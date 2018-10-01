# frozen_string_literal: true

class ScoresController < AppController
  before_action :authenticate_user!

  def create
    if params[:team_id].present?
      @score = Score.find_or_create_by(team_id: params[:team_id], match_id: params[:match_id], score: params[:score])
    else
      binding.pry
      ab = JSON.parse(params[:ab]).map { |v| [{ match_id: v[0], team_id: v[1], score: rand(0..100)}, { match_id: v[0], team_id: v[4], score: rand(0..100)}] }.flatten
      (ab).each do |score_params|
        Score.create(score_params)
      end
      redirect_to tournament_path(params[:tournament_id]) # reload
    end
  end

  def update

  end
end
