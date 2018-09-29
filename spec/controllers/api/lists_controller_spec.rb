require 'rails_helper'
include AssertJson

begin
  Api::ListsController
rescue
  Api::ListsController = nil
end

RSpec.describe Api::ListsController, :type => :controller do

  describe "ListController Get" do
    before do
      get :index, :format => 'json'
    end
    it 'should return all lists' do
      expect(response).to have_http_status(:success)
    end
  end

end
