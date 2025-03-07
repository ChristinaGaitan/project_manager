require 'rails_helper'

RSpec.feature "Users", type: :feature do
  fixtures :users
  let!(:user) { users(:one) }

  scenario "visiting the index" do
    visit users_path
    expect(page).to have_selector("h1", text: "Listing users")
  end

  scenario "creating a user" do
    visit users_path
    click_on "New User"

    fill_in "Email", with: "test#{user.email}"
    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    click_on "Save"

    expect(page).to have_text("User was successfully created")
    click_on "Back"
  end

  scenario "updating a user" do
    visit user_path(user)
    click_on "Edit", match: :first

    fill_in "Email", with: user.email
    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    click_on "Save"

    expect(page).to have_text("User was successfully updated")
    click_on "Back"
  end

  scenario "destroying a user", :skip do
    visit user_path(user)

    accept_alert do
      click_on "Destroy", match: :first
    end

    expect(page).to have_text("User was successfully destroyed")
  end
end
