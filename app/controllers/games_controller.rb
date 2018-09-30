# frozen_string_literal: true

class GamesController < AppController
  before_action :authenticate_user!
  before_action :set_game, only: [:edit, :destroy]

  def create
    @tournament = Tournament.find(params[:id])
    tournament = Tournament.create(tournament_params)
    if tournament.present?
      redirect_to new_abc_path, flash: { success: "Teams #{tournament.teams.map { |t| "'#{t.title}'" }.join(', ')} successfully created!" }
      # locales
    else
      redirect_to new_abc_path, flash: { danger: "Tournament was not created!" }
    end
  end
end
