# frozen_string_literal: true

class ToPlayOffService
  def call(tournament, winners_scores_all = [])
    @tournament = tournament
    @tournament.current_groups.each do |group_id|
      winners_scores, losers = WinnersLosersFirstService.call(@tournament, group_id)
      winners_scores_all << winners_scores
      SetOffService.call(losers)
    end
    winners_scores_all.flatten!(2)
    (winners_scores_all.count / 2).times do |i|
      MatchesGenerator.call(winners_scores_all[i][1], winners_scores_all[-(i + 1)][1], @tournament.next_group_id)
    end
    ScoresGenerator.call(tournament, @tournament.next_group_id)
  end
end
