class Api::V1::ProcessInstancesController < Api::ApiController

  def show
    pi = ProcessEngine::ProcessInstance.find(params[:id])
    render json: pi.attributes.slice("id", "status",  "states", "creator", "created_at", "updated_at")
  end

end
