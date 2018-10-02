class GenerateScoresService
  def self.call(tournament)
    matches = Match.where("group_id IN (?)", tournament.current_groups).distinct
    binding.pry
    matches.each do |match|
      Score.create(match_id: match.id, team_id: match.teams.first.id, score: nil)
      Score.create(match_id: match.id, team_id: match.teams.last.id, score: nil)
    end
  end
end
