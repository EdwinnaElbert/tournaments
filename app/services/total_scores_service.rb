class TotalScoresService
  def self.call(tournament, group_id)
    scores = Score.where("team_id in (?)", tournament.teams.where(group_id: group_id).pluck(:id))
    scores.map { |s| [s.team_id, s.score] }.group_by { |t| t[0] }.map{ |t| [t[1].map {|tt| tt[1]}.flatten.sum, t[0]] }.sort!
  end
end
