module VisitHelper
  def fill_name_and_save(name)
    fill_in 'Name', with: name
    click_button 'Save'
  end
end