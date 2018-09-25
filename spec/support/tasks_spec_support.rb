module TasksSpecSupport
  def fill_in_form(field, content, button_name)
    fill_in field, with: content
    click_button button_name
  end
end