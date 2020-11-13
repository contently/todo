# frozen_string_literal: true

module TasksHelper

  def tasks_to_display(show_completed, list)
    show_completed ? list.tasks.complete : list.tasks.incomplete 
  end

  def mark_complete_or_incomplete_text(task)
    task.completed ? "Mark incomplete" : "Mark complete"
  end

end
