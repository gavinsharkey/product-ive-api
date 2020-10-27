class AuthController < ApplicationController
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      payload = { user_id: @user.id }
      token = encode_token(payload)
      render json: { user: @user, jwt: token }
    else
      render json: { error: 'Incorrect Username Or Password' }
    end
  end

  def is_logged_in?
    if logged_in?
      render json: { user: session_user, logged_in: true }
    else
      render json: { logged_in: false }
    end
  end
end