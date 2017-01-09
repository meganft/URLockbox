require "rails_helper"

RSpec.describe "User can edit created links", :js => :true do
  before(:each) do
    user_login
  end

  scenario "after user creates a link, it can edit it" do
    fill_in "link-title", :with => "Turing"
    fill_in "link-url", :with => "http://turing.io"
    click_button "Add Link"

    within('#links-list') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
    end

    visit "links/#{Link.last.id}/edit"

    expect(page).to have_content("Edit Link Information")
  end
end
