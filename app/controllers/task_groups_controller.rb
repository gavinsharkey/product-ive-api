class TaskGroupsController < ApplicationController
  before_action :require_login

  def index
    @task_groups = current_user.task_groups.order(created_at: :desc)
    render json: @task_groups
  end

  def create
    @task_group = current_user.task_groups.build(task_group_params)
    if @task_group.save
      render json: @task_group, status: :created
    else
      render json: { errors: @task_group.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def task_group_params
    params.require(:task_group).permit(:name)
  end
end
