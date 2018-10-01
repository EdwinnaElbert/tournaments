class ArrangeMatchesService
  def initialize(tournament)
    @tournament = tournament
    if @tournament.aasm_state == "first_tour"
      shuffled = @tournament.teams.shuffle
      create_matches(shuffled, 0..7, 0)
      create_matches(shuffled, 8..15, 1)
    else
      
    end
  end

  def create_matches(shuffled, range, group_type)
    shuffled.slice(range).permutation(2).each do |team_pair|
      Match.create(group_id: @tournament.groups.where(group_type: group_type).first.id,
                  team_1_id: team_pair[0].id,
                  team_2_id: team_pair[1].id)
    end
  end
end
