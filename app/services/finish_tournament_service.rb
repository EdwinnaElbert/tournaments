# frozen_string_literal: true

class FinishTournamentService
  def self.call(tournament)
    winners, loosers = DivideWinnersLoosersService.call(tournament, tournament.current_groups)
    tournament.update_attributes(winner_id: winners.flatten![0])
  end
end
