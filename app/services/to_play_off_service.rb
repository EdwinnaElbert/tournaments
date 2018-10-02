# frozen_string_literal: true

# this class takes total score for teams in each group and sorts them by score ASC
# then for each group it splits scores into two parts,

class ToPlayOffService
  def self.call(tournament, winners_scores = [])
    tournament.current_groups.each_with_index do |group_id|
      team_total_scores = TotalScoresService.call(tournament, group_id)
      SetOffService.call(team_total_scores.slice(0..3))
      winners_scores << team_total_scores.slice(4..7)
    end
    CreatePlayOffMatchesService.call(tournament, winners_scores.flatten(1).sort)
  end
end
