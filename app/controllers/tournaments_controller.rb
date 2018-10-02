# frozen_string_literal: true

class TournamentsController < AppController
  before_action :authenticate_user!
  before_action :set_tournament, only: [:show, :destroy]

  def new
    @tournament = Tournament.new()
  end

  def show
    teams = @tournament.teams.pluck(:id)
    @tournament.groups.each do |group|
      self.instance_variable_set("@#{group.group_type}",
                                 Match.where(group_id: group.id).includes([scores: :team])
      )
    end
    group = @tournament.groups.first
  end

  def create
    @tournament = Tournament.create(tournament_params)
    if @tournament.present?
      CreateGroupService.call(@tournament)
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
      params.require(:tournament).permit(:title, teams_attributes: [ :id, :title, :off ])
    end
end
