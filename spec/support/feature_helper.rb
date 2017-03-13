module FeatureHelper
  def no_name_error
    fill_in "Name", with: ""
    click_button "Save"
    expect(page).to have_content("Name can't be blank")
  end
end
