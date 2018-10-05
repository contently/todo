# frozen_string_literal: true

require 'rails_helper'

feature 'Viewing tasks' do
  scenario 'directs to incompleted tasks page when visiting root path' do
    create_tasks_and_visit_root_path
    page.should have_css("td") #wait until tasks are loaded

    all('body table tr > td:nth-child(2)').each do |td|
      expect(td.text).to eq("false")
    end
  end

  scenario 'directs to completed tasks page when clicking completed link' do
    create_tasks_and_visit_root_path
    within("h2") do
      click_on "Completed"
    end
    page.should have_css("td")

    all('body table tr > td:nth-child(2)').each do |td|
      expect(td.text).to eq("true")
    end
  end
end