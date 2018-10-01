class CreateGroupService
  def self.call(tournament)
    Group.group_types.count.times do |i|
      Group.create(group_type: i, tournament: tournament)
    end
  end
end
