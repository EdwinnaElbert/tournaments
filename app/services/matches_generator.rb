# frozen_string_literal: true

class MatchesGenerator
  def self.call(team_1, team_2, group_id)
    match = Match.create(group_id: group_id)
    match.teams << Team.find(team_1)
    match.teams << Team.find(team_2)
  end
end
