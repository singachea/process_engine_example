class Api::V1::TasksController < Api::ApiController
  def index
    options = {
      user: "user_#{@user.id}"
    }
    tasks = ProcessEngine::ProcessQuery.task_get_all(options)
    render json: tasks
  end

end
