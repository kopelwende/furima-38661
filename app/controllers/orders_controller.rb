class OrdersController < ApplicationController 
  before_action :authenticate_user!
  before_action :item_find

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if  @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end     
  end



  private
  def order_address_params
    params.require(:order_address).permit(:post_code, :prefectures_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end 

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ""
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end
end
