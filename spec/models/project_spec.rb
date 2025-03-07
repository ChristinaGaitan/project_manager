require "rails_helper"

RSpec.describe Project, type: :model do
  it "is valid with a name" do
    project = Project.new(name: "Project 1")
    expect(project).to be_valid
  end
end
