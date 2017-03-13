require 'rails_helper'

describe User, type: :model do

  context "associations" do
    it { should have_many(:lists       ) }
    it { should have_many(:tasks       ) }
    it { should have_many(:task_changes) }
  end

end
