# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  name        :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

begin
  List
rescue
  List = nil
end

RSpec.describe List, :type => :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user) }
  it { should have_many(:tasks) }
  it { should belong_to(:user) }
end
