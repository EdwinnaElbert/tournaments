require "feature_helper"
require "acceptance/acceptance_helper"

feature "User can generate 56 matches" do
  given!(:user) { create(:user) }

  #given!(:tournament) { create(:tournament, :with_many_teams) }

  scenario "  ", js: true do
    sign_in(user)
    visit "/tournaments/new"
    fill_in "tournament_title", with: Faker::Alphanumeric.alphanumeric(20)

    16.times { |i| fill_in "tournament_teams_attributes_#{i + 1}_title", with: Faker::Alphanumeric.alphanumeric(20) }

    click_on "Create"
    click_on "To next round"
    16.times do |i|
      expect(page).to have_content(Tournament.first.teams[i].title)
    end

    click_on "Generate scores"

    expect(page).to have_content(Score.first.score)
  end
end
