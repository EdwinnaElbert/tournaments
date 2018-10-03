# frozen_string_literal: true

class UpdateCurrentGroupService
  def self.call(team_ids, group_id)
    Team.where(id: team_ids).update_all(group_id: group_id)
  end
end
