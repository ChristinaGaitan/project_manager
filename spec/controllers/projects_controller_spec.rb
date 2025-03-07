require "rails_helper"

RSpec.describe ProjectsController, type: :request do
  fixtures :projects
  let(:project) { projects(:one) }

  describe "GET /index" do
    it "returns a success response" do
      get projects_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns a success response" do
      get new_project_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates a new project and redirects to the project" do
      expect do
        post projects_url, params: { project: { name: project.name } }
      end.to change(Project, :count).by(1)
      
      expect(response).to redirect_to(project_url(Project.last))
    end
  end

  describe "GET /show" do
    it "returns a success response" do
      get project_url(project)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns a success response" do
      get edit_project_url(project)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /update" do
    it "updates the project and redirects to the project" do
      patch project_url(project), params: { project: { name: project.name } }
      expect(response).to redirect_to(project_url(project))
    end
  end

  describe "DELETE /destroy" do
    it "destroys the project and redirects to the projects list" do
      expect do
        delete project_url(project)
      end.to change(Project, :count).by(-1)

      expect(response).to redirect_to(projects_url)
    end
  end
end
