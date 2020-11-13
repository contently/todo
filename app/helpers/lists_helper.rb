module ListsHelper

  def list_title(complete)
    complete ? "Complete Tasks" : "Incomplete Tasks"
  end

  def list_link_text(complete)
    complete ? "View incomplete Tasks" : "View complete tasks"
  end

  def list_link_path(complete, list_id)
    complete ? list_path(list_id) : list_path(list_id, showcompleted: "true")
  end

end
