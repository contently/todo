# frozen_string_literal: true

module TasksHelper

  def tasks_to_display(show_completed, list)
    show_completed ? list.tasks.complete : list.tasks.incomplete 
  end

end
