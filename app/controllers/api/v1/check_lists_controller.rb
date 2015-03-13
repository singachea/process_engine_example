class Api::V1::CheckListsController < Api::ApiController
  before_action :check_task_access_right, only: [:make_appointment]

  def activate
    # get data, save in db, blah blah, ....
    # some work and validation or whatever here
    finisher = "user_#{@user.id}"
    ProcessEngine::ProcessQuery.task_complete(params[:id], {verified_state: 'start_process', finisher: finisher })
    render json: {status: 'success'}
  end

  def make_appointment
    # get data, save in db, blah blah, ....
    # some work and validation or whatever here
    finisher = "user_#{@user.id}"
    ProcessEngine::ProcessQuery.task_complete(params[:id], {verified_state: 'process_appointment', finisher: finisher })
    render json: {status: 'success'}
  end


end
