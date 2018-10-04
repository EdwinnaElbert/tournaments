require "feature_helper"
require "acceptance/acceptance_helper"

feature "Signed in admin creates tournament" do
  given!(:user) { create(:user) }

  # given!(:new_tournament) { build(:tournament) }
  given!(:tournament) { create(:tournament, :with_many_teams) }


  scenario "invalid: without attribute title", js: true do
    tournament.reload
    sign_in(user)
    visit "/tournaments/new"
    click_on "Create"
    expect(Tournament.count).to eq(1)
  end
end
