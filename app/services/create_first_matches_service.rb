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
      Team.where(id: team_ids).update_all(group_id: group_id)

      team_pairs = team_ids.combination(2).to_a

      team_pairs.each do |team_pair|
        match = Match.create(group_id: group_id)
        match.teams << Team.find(team_pair[0])
        match.teams << Team.find(team_pair[1])
      end
    end
    GenerateScoresService.call(tournament)
  end
end
