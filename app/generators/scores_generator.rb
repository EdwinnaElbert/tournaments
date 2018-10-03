# frozen_string_literal: true

class ScoresGenerator
  def self.call(tournament, group_ids)
    matches = Match.where("group_id IN (?)", group_ids)
    matches.each do |match|
      Score.find_or_create_by(match_id: match.id, team_id: match.teams.first.id, score: nil)
      Score.find_or_create_by(match_id: match.id, team_id: match.teams.last.id, score: nil)
    end
  end
end
