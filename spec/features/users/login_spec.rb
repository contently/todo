# HW5: Added auth tests
require 'rails_helper'

feature "Logging in" do
  let!(:user) { User.create(name: "AAA", password: "XYZ") }

  scenario "redirects to the user's lists page on success" do

  end

  scenario "displays an error when name or password are wrong" do

  end

  scenario "sets a session variable on success" do

  end

end
