class SubTasksController < ApplicationController
  def index
    @tasks = Task.where(parent_task_id: params[:task_id])
    render json: @tasks, include: [:taskable]
  end

  def create
    task_id = params[:task_id]
    if Task.exists?(task_id)
      @task = Task.new(task_params.merge({ parent_task_id: task_id }))
    else
      render json: { error: 'Parent Resource Not Found' }, status: :not_found
    end
    render json: @task, include: [:taskable]
  end

  private

  def task_params
    params.require(:task).permit(:name, :completed)
  end

end