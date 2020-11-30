class NoteGroupsController < ApplicationController
  before_action :require_login

  def index
    @note_groups = current_user.note_groups.order(created_at: :desc)
    render json: @note_groups
  end
end
