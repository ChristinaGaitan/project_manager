require "rails_helper"

RSpec.describe UsersController, type: :request do
  fixtures :users
  let(:user) { users(:one) }

  describe "GET /index" do
    it "returns a success response" do
      get users_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns a success response" do
      get new_user_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates a new user and redirects to the user" do
      expect do
        post users_url, params: { user: { email: "other#@user.email", first_name: user.first_name, last_name: user.last_name } }
      end.to change(User, :count).by(1)
      
      expect(response).to redirect_to(user_url(User.last))
    end
  end

  describe "GET /show" do
    it "returns a success response" do
      get user_url(user)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns a success response" do
      get edit_user_url(user)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /update" do
    it "updates the user and redirects to the user" do
      patch user_url(user), params: { user: { email: user.email, first_name: user.first_name, last_name: user.last_name } }
      expect(response).to redirect_to(user_url(user))
    end
  end

  describe "DELETE /destroy" do
    it "destroys the user and redirects to the users list" do
      expect do
        delete user_url(user)
      end.to change(User, :count).by(-1)

      expect(response).to redirect_to(users_url)
    end
  end
end
