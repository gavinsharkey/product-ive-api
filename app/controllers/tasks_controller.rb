class TasksController < ApplicationController
  before_action :require_login
  before_action :set_task, only: [:update]

  def index
    if params[:taskable_id]
      @tasks = self.current_user.grouped_tasks.where(taskable_id: params[:taskable_id])
    else
      @tasks = self.current_user.all_tasks
    end
    render json: @tasks, include: [:taskable]
  end

  def update
    if @task.update(task_params)
      render json: @task, include: [:taskable]
    else
      render json: { errors: @task.errors.full_messages }
    end
  end

  private

  def set_task
    @task = self.current_user.grouped_tasks.find_by(id: params[:id])
    render json: { errors: ['Unauthorized access: Not Your Resource'] } if !@task
  end

  def task_params
    params.require(:task).permit(:name, :completed)
  end
end
