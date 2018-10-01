class ArrangeMatchesService
  def initialize(tournament)
    @tournament = tournament
    binding.pry
    if @tournament.aasm_state == "first_tour"
      shuffled = @tournament.teams.shuffle
      create_matches(shuffled, 0..7, 0)
      create_matches(shuffled, 8..15, 1)
    else
      a_sql = "SELECT DISTINCT t.id,
                      t.title,
                      SUM(COALESCE(s.score, 0)) AS score_sum
               FROM teams t
               LEFT JOIN tournaments tr ON t.tournament_id = tr.id AND t.id = $1
               LEFT JOIN matches m ON m.team_1_id = t.id OR m.team_2_id = t.id
               LEFT JOIN scores s ON s.team_id = t.id
               LEFT JOIN groups g ON m.group_id = $2
               GROUP BY t.id, t.title
               ORDER BY t.title DESC"
      @a_best = ActiveRecord::Base.connection.select_all(a_sql, 'SQL', [[nil, @tournament.id], [nil, @tournament.groups.where(group_type: 0).first.id]])
      @b_best = ActiveRecord::Base.connection.select_all(a_sql, 'SQL', [[nil, @tournament.id], [nil, @tournament.groups.where(group_type: 1).first.id]])

      # a_sql query from controller move to service
      binding.pry
    end
  end

  def create_matches(shuffled, range, group_type)
    shuffled.slice(range).combination(2).each do |team_pair|
      Match.create(group_id: @tournament.groups.where(group_type: group_type).first.id,
                  team_1_id: team_pair[0].id,
                  team_2_id: team_pair[1].id)
    end
  end
end
