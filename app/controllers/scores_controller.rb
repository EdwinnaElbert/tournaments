# frozen_string_literal: true

class ScoresController < AppController
  before_action :authenticate_user!

  def create
    binding.pry
    if params[:team_id].present?
      @score = Score.find_or_create_by(team_id: params[:team_id], match_id: params[:match_id], score: params[:score])
    else
      
    end
  end

  def update

  end
end
