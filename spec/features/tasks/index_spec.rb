# frozen_string_literal: true

require 'rails_helper'

feature 'Viewing tasks' do
  scenario 'directs to incompleted tasks page when visiting root path' do
    visit root_path
    all("td.complete").each do |td|
      expect(td).to have_text("false")
    end
  end

  scenario 'directs to completed tasks page when clicking completed link' do
    visit root_path
    within("h2") do
      click_on "Completed"
    end

    all("td.complete").each do |td|
      expect(td).to have_text("true")
    end
  end
end