class NewGroupService
  def self.call(tournament)
    binding.pry
    tournament.current_state
    shuffled = tournament.teams.shuffle
    a = shuffled.slice(0..7)
    b = shuffled.slice(8..15)

    # Hash[*tournament.teams.shuffle]
    binding.pry
  end
end
