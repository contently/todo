# frozen_string_literal: true

module ApplicationHelper
  def audit_item(audit)
    content_tag(:div, class: 'audit-item', id: "audit-#{audit.id}") do
      concat link_to(audit.auditable_type, audit.auditable, class: 'auditable-link')
      if audit.auditable_type == 'Task' && audit.label == 'completed'
        concat content_tag(:span, ' was marked as completed')
      else
        concat content_tag(:span, " updated #{audit.label} from '#{audit.previous_value}' to '#{audit.new_value}'")
      end
    end
  end
end
