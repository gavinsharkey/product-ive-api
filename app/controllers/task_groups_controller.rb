class TaskGroupsController < ApplicationController
  # before_action :require_login

  def index
    user = session_user || User.find_by(id: params[:user_id])
    @task_groups = user.task_groups
    render json: @task_groups
  end
end
