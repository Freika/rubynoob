require 'rails_helper'

describe RepositoriesController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all repositories as @repositories" do
      repository = Repository.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:repositories)).to eq([repository])
    end
  end

  describe "GET #show" do
    it "assigns the requested repository as @repository" do
      repository = Repository.create! valid_attributes
      get :show, params: {id: repository.to_param}, session: valid_session
      expect(assigns(:repository)).to eq(repository)
    end
  end

  describe "GET #new" do
    it "assigns a new repository as @repository" do
      get :new, params: {}, session: valid_session
      expect(assigns(:repository)).to be_a_new(Repository)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Repository" do
        expect {
          post :create, params: {repository: valid_attributes}, session: valid_session
        }.to change(Repository, :count).by(1)
      end

      it "assigns a newly created repository as @repository" do
        post :create, params: {repository: valid_attributes}, session: valid_session
        expect(assigns(:repository)).to be_a(Repository)
        expect(assigns(:repository)).to be_persisted
      end

      it "redirects to the created repository" do
        post :create, params: {repository: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Repository.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved repository as @repository" do
        post :create, params: {repository: invalid_attributes}, session: valid_session
        expect(assigns(:repository)).to be_a_new(Repository)
      end

      it "re-renders the 'new' template" do
        post :create, params: {repository: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested repository" do
      repository = Repository.create! valid_attributes
      expect {
        delete :destroy, params: {id: repository.to_param}, session: valid_session
      }.to change(Repository, :count).by(-1)
    end

    it "redirects to the repositories list" do
      repository = Repository.create! valid_attributes
      delete :destroy, params: {id: repository.to_param}, session: valid_session
      expect(response).to redirect_to(repositories_url)
    end
  end

end
