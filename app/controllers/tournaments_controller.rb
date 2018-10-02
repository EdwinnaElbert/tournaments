# frozen_string_literal: true

class TournamentsController < AppController
  before_action :authenticate_user!
  before_action :set_tournament, only: [:show, :destroy]

  def new
    @tournament = Tournament.new()
  end

  def show
    sql = "SELECT m.id,
                    m.team_1_id,
                    t_1.title AS team_1_title,
                    s_1.score AS score_1,
                    m.team_2_id,
                    t_2.title AS team_2_title,
                    s_2.score AS score_2
             FROM matches m
      INNER JOIN teams t_1 ON m.team_1_id = t_1.id
      INNER JOIN teams t_2 ON m.team_2_id = t_2.id
      LEFT JOIN scores s_1 ON s_1.team_id = t_1.id AND s_1.match_id = m.id
      LEFT JOIN scores s_2 ON s_2.team_id = t_2.id AND s_2.match_id = m.id
      WHERE m.group_id = $1"

    # teams = @tournament.teams.pluck(:id)
    @tournament.groups.each do |group|
      self.instance_variable_set("@#{group.group_type}",
                                 ActiveRecord::Base.connection.
                                   select_all(sql,
                                              'SQL',
                                              [[nil, group.id]])
        # Match.includes([:team_1_score, :team_2_score, :team_1]).where("matches.group_id IN (?)", group.id)
        #              #.includes([:team_1_score, :team_2_score])
      )
    end
    binding.pry
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
