# frozen_string_literal: true

# this class shuffles teams
# then splits them into two groups and saves group type into team
# then it combines teams from each group inte pairs and creates new Match records
# TODO follow the order written above and separate this class

class CreateFirstMatchesService
  def self.call(tournament)
    @tournament = tournament
    shuffled = @tournament.teams.shuffle
    create_matches(shuffled, 0..7, 0)
    save_group_type(shuffled, 0..7, 0)
    create_matches(shuffled, 8..15, 1)
    save_group_type(shuffled, 8..15, 1)
  end

  def create_matches(shuffled, range, group_type)
    shuffled.slice(range).combination(2).each do |team_pair|
      Match.create(group_id: @tournament.groups.where(group_type: group_type).first.id,
                  team_1_id: team_pair[0].id,
                  team_2_id: team_pair[1].id)
    end
  end

  def save_group_type(shuffled, range, group_type)
    shuffled.slice(range).each do |team|
      Team.find(team.id).update_attributes(current_group_type: group_type)
    end
  end
end
