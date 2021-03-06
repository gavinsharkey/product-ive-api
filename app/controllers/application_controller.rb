class ApplicationController < ActionController::API
  def current_user
    @user ||= session_user || User.find_by(id: params[:user_id])
  end

  def encode_token(payload)
    JWT.encode(payload, '_somethingsomthing')
  end

  def logged_in?
    !!session_user
  end

  def require_login
    render json: { error: 'Unauthorized Request: Please Log In' }, status: :unauthorized unless logged_in?
  end

  def session_user
    decoded_hash = decoded_token
    if decoded_hash && !decoded_hash.empty?
      user_id = decoded_hash[0]['user_id']
      @session_user ||= User.find_by(id: user_id)
    else
      nil
    end
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, '_somethingsomthing', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        []
      end
    end
  end

  def auth_header
    request.headers['Authorization']
  end
end
