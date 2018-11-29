class Api::V1::PlayersController < ApplicationController

  def show
    render json: Player.first
  end

end
