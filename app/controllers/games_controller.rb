# frozen_string_literal: true

class GamesController < AppController
  before_action :authenticate_user!
  before_action :set_tournament

  def create
    unless @tournament.aasm_state == "final"
      @tournament.to_next_state
      ArrangeMatchesService.new(@tournament)
    end
    redirect_to tournament_path(@tournament)
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end
end
