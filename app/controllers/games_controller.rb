# frozen_string_literal: true

class GamesController < AppController
  before_action :authenticate_user!
  before_action :set_tournament

  def create
    binding.pry
    @tournament.next_state

    # @tournament.current_state.next
    # ArrangeMatchesService.call(@tournament)
  end

  def update

  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  def score_params

  end
end
