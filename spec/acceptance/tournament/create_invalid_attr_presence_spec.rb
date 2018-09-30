require "feature_helper"
require "acceptance/acceptance_helper"

feature "Signed in admin creates tournament" do
  given!(:admin_user) { create(:admin_user) }

  given!(:new_tournament) { build(:tournament) }
  given!(:tournament) { create(:tournament) }


    scenario "invalid: without attribute title", js: true do
      tournament.reload
      sign_in(admin_user)
      visit "/admin/tournaments/new"
        find("#tournament_active").click
      find('input[name="commit"]').click
      expect(Tournament.count).to eq(1)
    end
end
