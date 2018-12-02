class ApplicationController < ActionController::API

  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, Rails.application.credentials.dig(:jwt_secret_token))
    # EDITOR="subl --wait" bin/rails credentials:edit to change token
  end

  def auth_header
    #{'Authorization': 'Bearer <token>'}
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]

      begin
        JWT.decode(token, Rails.application.credentials.dig(:jwt_secret_token), true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      # decoded_token=> [{"player_id"=>2}, {"alg"=>"HS256"}]
      # or nil if we can't decode the token
      player_id = decoded_token[0]['player_id']
      @player = Player.find_by(id: player_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

end
