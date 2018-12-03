class Api::V1::PlayersController < ApplicationController

  skip_before_action :authorized, only: [:create]

  def show
    render json: @player, status: :accepted
  end

  def create
    @player = Player.create(player_params)
    if @player.valid?
      @token = encode_token(player_id: @player.id)
      render json: { player: PlayerSerializer.new(@player), token: @token }, status: :created
    else
      render json: { error: "failed to create player"}, status: :not_acceptable
    end
  end

  def update
    if @player.update(player_params)
      render json: @player, status: :accepted
    else
      render json: { message: "Failed to update player", error: true}, status: :not_acceptable
    end
  end

  def buy_horse
    body = JSON.parse(request.body.read())
    player = Player.find(body["playerId"])
    horse = Horse.find(body["horseId"])
    player.buy(horse)
    render json: player
  end

  private

  def player_params
    params.require(:player).permit(:email, :password, :name, :description)
  end

end
