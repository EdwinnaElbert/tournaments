# frozen_string_literal: true

class PlayOffService
  def call(tournament)
    @tournament = tournament
    winners_scores_all = []
    @tournament.current_groups.each_with_index do |group_id|
      winners_scores, loosers = DivideWinnersLoosersService.call(@tournament, group_id)
      winners_scores_all << winners_scores
      SetOffService.call(loosers)
    end
    (winners_scores_all.flatten!(2).count / 2).times do |i|
      MatchesGenerator.call(winners_scores_all[i][1], winners_scores_all[-(i + 1)][1], @tournament.next_group_id)
    end
    ScoresGenerator.call(tournament, @tournament.next_group_id)
  end
end
