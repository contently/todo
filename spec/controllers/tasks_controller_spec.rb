require 'rails_helper'

RSpec.describe TasksController, :type => :controller do
  create_full_test_case

  before(:each) do
    allow_message_expectations_on_nil
  end

  describe "Get #index" do
    context "when logged in as task's list owner" do
      before do
        task2.update_attributes(completed: true)
        allow(controller).to receive(:current_user) {owner}
      end
      it "renders all the tasks belonging to the list" do
        get :index, params: {list_id: list.id, id: task.id}
        expect(response).to render_template(:index)
      end

      it "only renders uncompleted tasks by default" do
        get :index, params: {list_id: list.id, id: task.id}
        expect(assigns(:tasks)).to_not include(task2)
        expect(assigns(:tasks)).to include(task)
      end

      it "only renders completed tasks if given params[:completed] = 'true'" do
        get :index, params: {list_id: list.id, id: task.id, completed: "true"}
        expect(assigns(:tasks)).to include(task2)
        expect(assigns(:tasks)).to_not include(task)
      end
    end

  end

  describe "Get #show" do
    let(:task) { Task.create!(completed: false, name: "task", list_id: list.id)}

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
        expect(response).to render_template(:new)
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

  describe "POST #create" do
    before do
      allow(controller).to receive(:current_user) {owner}
    end

    context "when logged in" do
      context "with invalid params" do
        it "validates the presence of name and completed status" do
          post :create, params: {list_id: list.id, task: {completed: false }}
          expect(response).to render_template(:new)
        end
      end
    end
  end
end
