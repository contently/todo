require 'rails_helper'

# So specs will run and not throw scary errors before SessionsController is implemented
begin
  SessionsController
rescue
  SessionsController = nil
end

RSpec.describe SessionsController, :type => :controller do
  let!(:user) { User.create({nickname: "jack_bruce", password: "abcdef"}) }

  describe "GET #new" do
    it "renders the new session template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with invalid credentials" do
      it "returns to sign in with an non-existent user" do
        post :create, user: {nickname: "jill_bruce", password: "abcdef"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end

      it "returns to sign in on bad password" do
        post :create, user: {nickname: "jack_bruce", password: "notmypassword"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid credentials" do
      it "redirects user to todo lists index on success" do
        post :create, user: {nickname: "jack_bruce", password: "abcdef"}
        expect(response).to redirect_to(todo_lists_url)
      end

      it "logs in the user" do
        post :create, user: {nickname: "jack_bruce", password: "abcdef"}
        user = User.find_by_nickname("jack_bruce")

        expect(session[:session_token]).to eq(user.session_token)
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      post :create, user: {nickname: "jack_bruce", password: "abcdef"}
      @session_token = User.find_by_nickname("jack_bruce").session_token
    end

    it "logs out the current user" do
      delete :destroy
      expect(session[:session_token]).to be_nil

      jack = User.find_by_nickname("jack_bruce")
      expect(jack.session_token).not_to eq(@session_token)
    end
  end
end
