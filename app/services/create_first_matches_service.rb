# frozen_string_literal: true

# this class shuffles teams
# then splits them into two groups and saves group type into team
# then it combines teams from each group inte pairs and creates new Match records
# TODO follow the order written above and separate this class

class CreateFirstMatchesService
  def self.call(tournament)
    shuffled_teams = tournament.teams.shuffle.in_groups(2)
    shuffled_teams.each_with_index do |teams_in_group, group_type|
      group_id = Group.where(tournament_id: tournament.id, group_type: group_type).first.id

      team_ids = teams_in_group.pluck(:id)
      binding.pry
      Team.where(id: team_ids).update_all(group_id: group_id)

      team_pairs = team_ids.combination(2).to_a
      matches_attrs = team_pairs.map { |team_pair| { team_1_id: team_pair[0],
                                                     team_2_id: team_pair[1],
                                                     group_id:  group_id } }
      Match.create(matches_attrs)
    end
  end
end
