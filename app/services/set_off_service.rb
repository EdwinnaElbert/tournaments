class SetOffService
  def self.call(team_scores)
    team_ids = team_scores.map { |t| t[1] }
    Team.where(id: team_ids).update_all(off: true)
  end
end
