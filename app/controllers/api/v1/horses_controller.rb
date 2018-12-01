class Api::V1::HorsesController < ApplicationController

  def toggle_for_sale
    @horse = Horse.find(params[:horse_id])
    @horse.toggle_for_sale
    render json: @horse.player.horses
  end

  def update
    @horse = Horse.find(params[:id])
    if @horse.update_attributes(horse_params)
      render json: @horse.player.horses
    else
      render json: {message: "Could not update"}
    end
  end

  private

  def horse_params
    params.require(:horse).permit(:name, :color, :image_url, :sale_price)
  end

end
