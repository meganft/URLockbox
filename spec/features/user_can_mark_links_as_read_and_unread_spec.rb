require "rails_helper"

RSpec.describe "User can edit created links", :js => :true do
  before(:each) do
    user_login
  end

  scenario "after user creates a link, it can mark it as read" do

    fill_in "link-title", :with => "Turing"
    fill_in "link-url", :with => "http://turing.io"
    click_button "Add Link"

    within('#links-list') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
      expect(page).to have_text("http://turing.io")
      expect(page).to have_text("Read?: false")
    end

    click_button "Mark as Read"

    within('#links-list') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
      expect(page).to have_text("http://turing.io")
      expect(page).to have_text("Read?: true")
    end
  end

  scenario "after user creates a link, it can mark it as unread" do

    fill_in "link-title", :with => "Turing"
    fill_in "link-url", :with => "http://turing.io"
    click_button "Add Link"

    click_button "Mark as Read"

    within('#links-list') do
      expect(page).to have_text("Read?: true")
    end

    click_button "Mark Unread"

    within('#links-list') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
      expect(page).to have_text("Read?: false")
    end
  end
end
