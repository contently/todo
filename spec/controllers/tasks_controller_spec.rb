require 'rails_helper'

RSpec.describe TasksController, :type => :controller do
  let(:owner) { User.create!( username: "owner", password: "password") }

  let(:other_user) { User.create!( username: "other", password: "password" ) }

  let(:list) {List.create!( name: "list", user_id: owner.id, description: "this is a list" )}

  before(:each) do
    allow_message_expectations_on_nil
  end

  describe "Get #show" do
    let(:task) { Task.create!(name: "task", list_id: list.id, completed: false)}

    context "when logged in as the owner" do
      before do
        allow(controller).to receive(:current_user) { owner }
      end
      it "renders the tasks show" do
        get :show, params: {list_id: list.id, id: task.id}
        expect(response).to render_template(:show)
      end
    end

    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end
      it "redirects to the login page" do
        get :show, params: {list_id: list.id, id: task.id}
        expect(response).to redirect_to(new_session_url)
      end

      context "when not the owner" do
        before do
          allow(controller).to receive(:current_user) { not_owner }
        end

        it "does not render the show page" do
          begin
            get :show, params: {list_id: list.id, id: task.id}
          rescue ActiveRecord::RecordNotFound
          end
          expect(response).not_to render_template(:show)
        end
      end
    end
  end

  describe "Get #new" do
    context "when logged in as task's list owner" do
      before do
        allow(controller).to receive(:current_user) {owner}
      end

      it "renders the new tasks page" do
        get :new, params: {list_id: list.id}
        expect(response).to redirect_to(new_list_task_url)
      end
    end

    context "when not logged in as task's list owner" do
      before do
        allow(controller).to receive(:current_user) {not_owner}
      end

      it "does not render new tasks page" do
        get :new, params: {list_id: list.id}
        expect(response).to_not redirect_to(new_list_task_url)
      end
    end

    context "when not logged in" do
      before do
        allow(controller).to receive(:current_user) {nil}
      end

      it "does not render the new tasks page" do
        get :new, params: {list_id: list.id}
        expect(response).to_not redirect_to(new_list_task_url)
      end
    end
  end
end
