# frozen_string_literal: true

class PlayOffService
  def call(tournament)
    @tournament = tournament


    @tournament.current_groups.each_with_index do |group_id|
      winners_scores, loosers = DivideWinnersLoosersService.call(tournament, group_id)
      divide_by_score(group_id)
    end
    (@winners_scores.count / 2).times do |i|
      MatchesGenerator.call(@winners_scores[i][1], @winners_scores[-(i + 1)][1], next_group_id)
    end
    GenerateScoresService.call(tournament)
  end

  private

  def divide_by_score(group_id)
    SetOffService.call(team_total_scores(group_id).slice(0..3))
    @winners_scores << team_total_scores(group_id).slice(4..7)
  end

  def next_group_id
    @tournament.groups.where("id > ?", @tournament.current_groups.last).first.id || @tournament.groups.last.id
  end

  def team_total_scores(group_id)
    scores = Score.where("team_id in (?)", @tournament.teams.where(group_id: group_id).pluck(:id))
    scores.map { |s| [s.team_id, s.score] }.group_by { |t| t[0] }.map{ |t| [t[1].map {|tt| tt[1]}.flatten.sum, t[0]] }.sort!
  end
end
