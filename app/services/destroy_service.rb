class DestroyService
  def self.call
    Score.destroy_all
    Match.destroy_all
    Group.destroy_all
    Tournament.destroy_all
    Team.destroy_all
  end
end
