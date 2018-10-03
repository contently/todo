# frozen_string_literal: true

require 'rails_helper'

feature 'Visiting the tasks index' do
  let!(:task) { Task.create(name: 'An incomplete task', completed: false) }
  let!(:task1) { Task.create(name: 'A complete task', completed: true) }

  scenario 'shows only incomplete tasks' do
    visit tasks_path

    expect(page).to have_content('An incomplete task')
    expect(page).not_to have_content('A complete task')

    click_link('Incomplete tasks')

    expect(page).to have_content('An incomplete task')
    expect(page).not_to have_content('A complete task')

    click_link('Completed tasks')

    expect(page).not_to have_content('An incomplete task')
    expect(page).to have_content('A complete task')
  end
end
