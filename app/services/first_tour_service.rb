# frozen_string_literal: true

class FirstTourService
  def call(tournament)
    shuffled_teams = tournament.teams.shuffle.in_groups(2)
    tournament.current_groups.each_with_index do |group_id, i|
      team_ids_in_group = shuffled_teams[i].pluck(:id)

      UpdateCurrentGroupService.call(team_ids_in_group, group_id)
      team_pairs = team_ids_in_group.combination(2).to_a
      team_pairs.each do |team_pair|
        MatchesGenerator.call(team_pair[0], team_pair[1], group_id)
      end
    end
    ScoresGenerator.call(tournament, tournament.current_groups)
  end
end
