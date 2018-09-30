require "feature_helper"
require "acceptance/acceptance_helper"

feature "Signed in admin creates tournament" do
  given!(:user) { create(:user) }

  given!(:new_tournament) { build(:tournament) }

  scenario "with valid attrs", js: true do
    sign_in(user)
    visit "/tournaments/new"
    fill_in "tournament_title", with: new_tournament.title
    16.times do |i|
      fill_in "tournament_teams_attributes_#{i + 1}_title", with: Faker::ElderScrolls.creature
    end
    # find(I18n.t('tournaments.create')).click
    click_on "Create"
    expect(Tournament.count).to eq(1)
    expect(Tournament.first.title).to eq(new_tournament.title)
    expect(Tournament.first.teams.count).to eq(16)
  end
end
