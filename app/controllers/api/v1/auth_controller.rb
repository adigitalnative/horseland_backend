class Api::V1::AuthController < ApplicationController

  skip_before_action :authorized, only: [:create]

  def create
    @player = Player.find_by(email: player_login_params(:email))
    if @player && @player.authenticate(player_login_params(:password))
      token = encode_token({ player_id: @player.id })
      render json: { player: PlayerSerializer.new(@player), token: token }, status: :accepted
    else
      render json: { message: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def player_login_params
    # params { player: {email: 'mail@foo.com', password: 'hi' } }
    params.require(:player).permit(:email, :password)
  end

end
