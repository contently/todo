# frozen_string_literal: true

require 'rails_helper'

feature 'Filtering a task', js: true do
  let!(:completed) { create(:task, :completed) }
  let!(:incomplete) { create(:task, :incomplete) }

  before { visit tasks_path }

  scenario 'by completed' do
    select 'completed', from: 'completed'

    expect(page).to have_content(completed.name)
    expect(page).not_to have_content(incomplete.name)
  end

  scenario 'by incomplete' do
    select 'incomplete', from: 'completed'

    expect(page).not_to have_content(completed.name)
    expect(page).to have_content(incomplete.name)
  end
end
