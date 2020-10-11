class TaskGroupsController < ApplicationController
  before_action :require_login

  def index
    @task_groups = current_user.task_groups
    render json: @task_groups
  end
end
