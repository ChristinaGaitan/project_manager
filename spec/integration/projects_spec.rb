require "rails_helper"

RSpec.feature "Projects", type: :feature do
  fixtures :projects
  let(:project) { projects(:one) }

  scenario "Visiting the index" do
    visit projects_url
    expect(page).to have_selector("h1", text: "Listing projects")
  end

  scenario "Creating a project" do
    visit projects_url
    click_on "New Project"

    fill_in "Name", with: project.name
    click_on "Save"

    expect(page).to have_text("Project was successfully created")
    click_on "Back"
  end

  scenario "Updating a project" do
    visit project_url(project)
    click_on "Edit", match: :first

    fill_in "Name", with: project.name
    click_on "Save"

    expect(page).to have_text("Project was successfully updated")
    click_on "Back"
  end

  scenario "Destroying a project", :skip do
    visit project_url(project)

    accept_alert do
      click_on "Destroy", match: :first
    end

    expect(page).to have_text("Project was successfully destroyed")
  end
end