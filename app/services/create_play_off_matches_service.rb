# frozen_string_literal: true

class CreatePlayOffMatchesService
  def self.call(tournament, winners_scores, matches_attr = [])
    next_group_id = tournament.groups.where("id > ?", tournament.current_groups.last).first.id || tournament.groups.last.id
    (winners_scores.count / 2).times { |i|  matches_attr << { team_1_id: winners_scores[i][1], team_2_id: winners_scores[-(i + 1)][1], group_id: next_group_id } }
    matches = Match.create(matches_attr)
  end
end
