require 'rails_helper'

describe TaskChange, type: :model do

  context "associations" do
    it { should belong_to(:task) }
  end

end
