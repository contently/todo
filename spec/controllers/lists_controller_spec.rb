require 'rails_helper'

begin
  ListsController
rescue
  ListsController = nil
end

RSpec.describe ListsController, :type => :controller do
  let(:jack) { User.create!(username: 'jack_bruce', password: 'abcdef') }

  before(:each) do
    allow_message_expectations_on_nil
  end

  describe "GET #new" do
    context "when logged in" do

      before do
        allow(controller).to receive(:current_user) { jack }
      end

      it "renders the new lists page" do
        get :new
        expect(response).to render_template("new")
      end
    end

    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        get :new
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe "POST #create" do

    before do
      allow(controller).to receive(:current_user) { jack }
    end
    context "when logged in" do

      context "with invalid params" do
        it "validates the presence of title and description" do
          post :create, params: {list: { description: "this is an invalid list"} }
          expect(response).to render_template("new")
          expect(flash[:errors]).to be_present
        end
      end

      context "with valid params" do
        it "redirects to the  list's show page" do
          post :create, params: {list: { name: "Things to Do", description: "do it"} }
          expect(response).to redirect_to(list_url(List.last))
        end
      end
    end

    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        post :create, params: { list: {name: "Things to Do", description: "do it"} }
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe "GET #index" do
    context "when logged in" do

      before do
        allow(controller).to receive(:current_user) { jack }
      end

      it "renders the lists index" do
        get :index
        expect(response).to render_template("index")
      end
    end

    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        get :index
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  xdescribe "GET #show" do
    create_jill_with_list

    context "when logged in as the  list's owner" do

      before do
        allow(controller).to receive(:current_user) { jill }
      end

      it "renders the show page" do
        get :show, params: {id: jill_list.id}
        expect(response).to render_template(:show)
      end
    end

    context "when logged in as a different user" do
      before do
        allow(controller).to receive(:current_user) { jack }
      end

      it "does not render the show page" do
        begin
          get :show, params: {id: jill_list.id}
        rescue ActiveRecord::RecordNotFound
        end

        expect(response).not_to render_template(:show)
      end
    end
  end

  describe "GET #edit" do
    create_jill_with_list

    context "when logged in as the  list's owner" do

      before do
        allow(controller).to receive(:current_user) { jill }
      end

      it "renders the edit page" do
        get :edit, params: {id: jill_list.id}
        expect(response).to render_template("edit")
      end
    end

    context "when logged in as a different user" do
      before do
        allow(controller).to receive(:current_user) { jack }
      end

      it "does not render the edit page" do
        begin
          get :edit, params: {id: jill_list.id}
        rescue ActiveRecord::RecordNotFound
        end

        expect(response).not_to render_template("edit")
      end
    end
  end


  describe "PATCH #update" do
    create_jill_with_list

    context "when logged in as the list's owner" do

      before do
        allow(controller).to receive(:current_user) { jill }
      end

      it "allows users to update their  lists" do
        patch :update, params: {id: jill_list.id, list: {name: "Jill Todo"}}

        updated_list = List.find(jill_list.id)
        expect(updated_list.name).to eq("Jill Todo")
      end
    end

    context "when logged in as a different user" do

      before do
        allow(controller).to receive(:current_user) { jack }
      end

      it "does not allow users to update another user's  lists" do
        begin
          patch :update, params: {id: jill_list.id, list: {name: "Jack Hax"}}
        rescue ActiveRecord::RecordNotFound
        end

        updated_list = List.find(jill_list.id)
        expect(updated_list.name).to eq("Jill List")
      end
    end
  end
end
