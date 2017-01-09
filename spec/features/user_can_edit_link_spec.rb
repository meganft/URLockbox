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

    fill_in "link-title", :with => "New Turing"
    click_button "Save"

    expect(current_path).to eq links_path
  end

  scenario "after user creates a link, it cannot edit it with wrong params" do
    fill_in "link-title", :with => "Turing"
    fill_in "link-url", :with => "http://turing.io"
    click_button "Add Link"

    within('#links-list') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
    end

    link = Link.last

    visit "links/#{link.id}/edit"

    expect(page).to have_content("Edit Link Information")

    fill_in "link-url", :with => "turing.io"

    click_button "Save"

    save_and_open_page

    expect(page).to have_content("Url is not a valid URL")
    expect(current_path).to eq "/links/#{link.id}"
  end

end
