class AppointmentHook
  class << self
    # [required] to distinguish the namespace
    def process_definition_slug
      "tuansing"
    end

    # [required] to tell what to implement
    def implemented_node_ids
      [:process_appointment, :handover_gateway]
    end

    # [required] to forward the implementation
    def forward_implementation_method(node_id, source_object)
      # source_object could be process_instance_object (when it's movable node)
      # source_object could be task_process_object (when it's task node)
      send("implement_#{node_id}", source_object)
    end

    def implement_process_appointment(process_instance_object)
      # { assignee: "random_assignee", candidate_users: ["chea", "lim"], candidate_groups: ["sale", "marketing"] } # return this node option here
      { assignee: "reamream"}
    end

    def implement_handover_gateway(process_instance_object)
      task = process_instance_object.last_process_task_by_state_name("process_appointment")
      value = task.data["handover_gateway_choice"] || ["cancel", "submit"].sample
      { exclusive_gateway_choice_value: value } # return this node option here
    end

  end
end
