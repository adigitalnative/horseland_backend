class Api::V1::HorsesController < ApplicationController

  def toggle_for_sale
    @horse = Horse.find(params[:horse_id])
    @horse.toggle_for_sale
    render json: @horse.player.horses
  end

end
