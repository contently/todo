require 'rails_helper'

feature 'Viewing all tasks' do
    scenario 'when visiting the page the first time, View All link is available' do
        visit tasks_path
        
        expect(page).to have_link("View All", href: tasks_path(all: true))
    end

    scenario 'when clicking View All, Incomplete tasks link is available' do
        visit tasks_path(all: true)

        expect(page).to have_link("Incomplete tasks", href: tasks_path)
    end
    
end