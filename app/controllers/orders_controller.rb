class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if  @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end     
  end

  private
  def order_address_params
    params.require(:order_address).permit(:post_code, :prefectures_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end #require(:order_address)がなぜかどうやっても通らない
end
