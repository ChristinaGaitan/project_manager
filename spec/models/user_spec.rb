require "rails_helper"

RSpec.describe Project, type: :model do
  it "is valid with a name and email" do
    user = User.new(first_name: "John", email: "john@example.com")
    expect(user).to be_valid
  end
end