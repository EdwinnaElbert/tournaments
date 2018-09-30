# frozen_string_literal: true

class TournamentsController < AppController
  before_action :authenticate_user!
  before_action :set_tournament, only: [:show, :destroy]

  def new
    @tournament = Tournament.new()
  end

  def show
    # @a_group = @tournament.games.where(game_type: "A")
    # @b_group = @tournament.games.where(game_type: "A")
  end

  def create
    @tournament = Tournament.create(tournament_params)
    if @tournament.present?
      redirect_to tournament_path(@tournament), flash: { success: "Teams #{@tournament.teams.map { |t| "'#{t.title}'" }.join(', ')} successfully created!" }
    else
      redirect_to new_tournament_path, flash: { errors: @tournament.errors.messages }
    end
  end

  def destroy; end

  private

    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    def tournament_params
      params.require(:tournament).permit(:title, teams_attributes: [ :title ])
    end
end
