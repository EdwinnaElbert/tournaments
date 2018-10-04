# frozen_string_literal: true

class FinishTournamentService
  def self.call(tournament)
    scores = ScoresService.call(tournament.groups.last.id).flatten
    tournament.update_attributes(winner_id: scores.first.team_id)
  end
end
