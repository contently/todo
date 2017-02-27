require 'rails_helper'

feature "User resources" do
  let(:user) { create(:user) }
  let(:list) { create(:list) }
  let(:task) { create(:task) }

  before do
    login_as user
  end

  context "throws error when accessing different user's resource" do
    it "when resource is other user's list" do
      expect { visit list_path(list) }.to raise_error('Unauthorized')
    end

    it "when resource is other user's task" do
      expect { visit list_task_path(list, task) }.to raise_error('Unauthorized')
    end
  end
end
