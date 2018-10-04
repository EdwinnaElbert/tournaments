# frozen_string_literal: true

class PlayOffService
  def call(tournament)
    @tournament = tournament
    group_id = @tournament.current_groups.first
    winners_scores, loosers = WinnersLoosersPlayOffService.call(@tournament, group_id)
    SetOffService.call(loosers)
    (winners_scores.count / 2).times do |i|
      MatchesGenerator.call(winners_scores[i][1], winners_scores[-(i + 1)][1], @tournament.next_group_id)
    end
    ScoresGenerator.call(tournament, @tournament.next_group_id)
  end
end
