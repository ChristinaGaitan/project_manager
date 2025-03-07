require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Listing users"
  end

  test "should create user" do
    visit users_url
    click_on "New User"

    fill_in "Email", with: "test#{@user.email}"
    fill_in "First name", with: @user.first_name
    fill_in "Last name", with: @user.last_name
    click_on "Save"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Edit", match: :first

    fill_in "Email", with: @user.email
    fill_in "First name", with: @user.first_name
    fill_in "Last name", with: @user.last_name
    click_on "Save"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    skip "This test is not yet functional"

    visit user_url(@user)

    accept_alert do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
