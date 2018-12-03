class Api::V1::AuthController < ApplicationController

  skip_before_action :authorized, only: [:create]

  def create
    @player = Player.find_by(email: auth_params[:email])
    if @player && @player.authenticate(auth_params[:password])
      token = encode_token({ player_id: @player.id })
      render json: { player: PlayerSerializer.new(@player), token: token, error: false }, status: :accepted
    else
      render json: { message: 'Invalid email or password', error: true }, status: :unauthorized
    end
  end

  private

  def auth_params
    # params { player: {email: 'mail@foo.com', password: 'hi' } }
    params.require(:auth).permit(:email, :password)
  end

end
