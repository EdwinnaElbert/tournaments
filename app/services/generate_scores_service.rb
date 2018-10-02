class GenerateScoresService
  def self.call(tournament)
    # Match.where('team_1_id IN (?) OR team_2_id IN (?) AND group_id IN (?)', @trn.team_ids, @trn.team_ids, [@trn.groups.where(group_type: 0).first.id, @trn.groups.where(group_type: 1).first.id])
    Match.where('team_1_id IN (?) OR team_2_id IN (?) AND group_id IN (?)', @trn.team_ids, @trn.team_ids, @trn.current_group_ids)
  end

  def total_scores(group_type)
    scores = Score.where("team_id in (?)", @tournament.group_teams(group_type).pluck(:id))
    scores.map { |s| [s.team_id, s.score] }.group_by { |t| t[0] }.map{ |t| [t[1].map {|tt| tt[1]}.flatten.sum, t[0]] }.sort!
  end

  def set_off(teams)
    team_ids = teams.map { |t| t[1] }
    Team.find(team_ids).update_all(off: true)
  end
end
