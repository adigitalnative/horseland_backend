class Api::V1::PlayersController < ApplicationController

  def show
    render json: Player.first
  end

  def buy_horse
    body = JSON.parse(request.body.read())
    player = Player.find(body["playerId"])
    horse = Horse.find(body["horseId"])
    player.buy(horse)
    render json: player
  end

end
