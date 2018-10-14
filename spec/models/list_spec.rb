require 'rails_helper'

begin
  TodoList
rescue
  TodoList = nil
end

RSpec.describe TodoList, :type => :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:description) }
  it { should have_many(:items) }
  it { should belong_to(:user) }
end
