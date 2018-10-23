# frozen_string_literal: true

class MatchesController < AppController
  # before_action :authenticate_user!
  before_action :set_tournament

  def create
    @tournament.to_next_state! unless @tournament.aasm_state == Tournament::TOURNAMENT_STATES[-1].to_s
    redirect_to tournament_path(@tournament)
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end
end
