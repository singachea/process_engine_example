class Api::ApiController < ApplicationController
  before_action :user_authentication

  private

  def user_authentication
    # you can pull from real database here and authenticate properly here
    @user = OpenStruct.new(id: params[:user_id] || 123, name: "random name here")
  end

  def check_task_access_right
    result = ProcessEngine::ProcessQuery.task_accessible?(params[:task_id] || params[:id], "user_#{params[:user_id] || 123}" )
    render json: { status: "fail"}, status: 403 unless result
  end
end
