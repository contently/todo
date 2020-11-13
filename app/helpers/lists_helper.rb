module ListsHelper

  def list_title(complete)
    complete ? "Complete Tasks" : "Incomplete Tasks"
  end

end
