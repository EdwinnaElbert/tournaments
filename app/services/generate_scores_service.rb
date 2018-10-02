class GenerateScoresService
  def self.call(tournament)
    team_ids = tournament.team_ids
    binding.pry
    matches = Match.where("team_1_id IN (?) OR team_2_id IN (?) AND group_id IN (?)", team_ids, team_ids, tournament.current_groups)
    score_attrs = matches.map { |match| [{ team_id: match.team_1_id,
                                           score: rand(tournament.min_score..tournament.max_score),
                                           match_id: match.id },
                                         { team_id: match.team_2_id,
                                           score: rand(tournament.min_score..tournament.max_score),
                                           match_id: match.id }] }.flatten
    Score.create(score_attrs)
  end
end
