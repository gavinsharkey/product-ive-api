class TasksController < ApplicationController
  before_action :require_login

  def index
    user = session_user || User.find_by(id: params[:user_id])
    if params[:taskable_id]
      @tasks = user.grouped_tasks.where(taskable_id: params[:taskable_id])
    else
      @tasks = user.all_tasks
    end
    render json: @tasks, include: [:taskable]
  end
end
