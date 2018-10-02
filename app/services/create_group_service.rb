# frozen_string_literal: true

class CreateGroupService
  def self.call(tournament)
    Group.group_types.count.times do |i|
      Group.create(group_type: i, tournament_id: tournament.id)
    end
  end
end
