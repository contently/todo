# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  name       :string
#  completed  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  list_id    :integer
#


require 'rails_helper'

describe Task, type: :model do
  let(:user) {User.create!(username: "username", password: "password")}
  let(:list) {List.create!( name: "list", user_id: user.id)}
  context 'with no name' do
    it 'is invalid' do
      task = Task.new
      task.list = list
      expect(task).to_not be_valid
    end
  end

  context 'with completed as true' do
    it 'is invalid' do
      task = Task.new( name: "task", completed: true )
      task.list = list
      expect(task).to_not be_valid
    end
  end

  context 'with name and completed set to false' do
    it 'is valid' do
      task = Task.new( name: "task", completed: false )
      task.list = list
      expect(task).to be_valid
    end
  end

end
