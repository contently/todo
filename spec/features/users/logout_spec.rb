# HW5: Added auth tests
require 'rails_helper'

feature "Logging out" do
  let!(:user) { User.create(name: "AAA", password: "XYZ") }

  scenario "redirects to login page on success" do

  end

  scenario "clears a session variable on success" do

  end

end
