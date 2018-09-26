require 'rails_helper'

feature 'Viewing all tasks' do
    scenario 'when visiting the page the first time, View All link is available' do
        visit tasks_path
        expect(page).to have_content("View All")
    end

    scenario 'when clicking View All, Incomplete tasks link is available' do
        visit tasks_path
        click_on 'View All'

        expect(page).to have_content("Incomplete tasks")
    end

    scenario 'when clicking Incomplete tasks, View All link is available' do
        visit tasks_path(all: true)
        click_on 'Incomplete tasks'

        expect(page).to have_content("View All")
    end
    
end