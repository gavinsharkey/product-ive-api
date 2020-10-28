class TasksController < ApplicationController
  before_action :require_login
  before_action :set_task, only: [:update, :destroy]

  def index
    if params[:taskable_id]
      @tasks = self.current_user.grouped_tasks.where(taskable_id: params[:taskable_id]).order(created_at: :desc)
    elsif params[:task_id]
      @tasks = Task.where(parent_task_id: params[:task_id])
    else
      @tasks = self.current_user.all_tasks
    end
    render json: @tasks, include: [:taskable]
  end

  def create
    if params[:taskable_id]
      # Applying the params at a low level avoids having to first find the TaskGroup
      with_taskable = task_params.merge({ taskable_id: params[:taskable_id], taskable_type: 'TaskGroup' })
      @task = Task.new(with_taskable)
    elsif params[:task_id]
      task_id = params[:task_id]
      if Task.exists?(task_id)
        @task = Task.new(task_params.merge({ parent_task_id: task_id }))
      else
        render json: { error: 'Parent Resource Not Found' }, status: :not_found
      end
    else
      @task = self.current_user.ungrouped_tasks.build(task_params)
    end
    
    if @task.save
      render json: @task, include: [:taskable]
    else
      render json: { errors: @task.errors.full_messages }
    end
  end

  def update
    if @task.update(task_params)
      render json: @task, include: [:taskable]
    else
      render json: { errors: @task.errors.full_messages }
    end
  end

  def destroy
    @task.destroy
    if @task.destroyed?
      render json: { destroyed: true }, status: :ok
    else
      render json: { destroyed: false }, status: :unprocessable_entity
    end
  end

  private

  def set_task
    if params[:task_id]
      @task = Task.find_by(parent_task_id: params[:task_id], id: params[:id])
    else
      @task = self.current_user.all_tasks.find_by(id: params[:id])
    end
    render json: { errors: ['Unauthorized access: Not Your Resource'] } if !@task
  end

  def task_params
    params.require(:task).permit(:name, :completed)
  end
end
