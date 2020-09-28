class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      payload = {user_id: @user.id}
      token = encode_token(payload)
      render json: { user: @user, jwt: token }
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  private

  def user_params
    params.require(:user).permit(:display_name, :email, :password)
  end
end
