require 'rails_helper'

describe Task, type: :model do
  it "should create an audit entry upon create" do
    @task = Task.new(name: "Whatever", completed: true)
    @task.save
    @task.reload
    expect(@task.audits.length).to eq 2
  end
end