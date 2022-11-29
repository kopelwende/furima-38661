class OrdersController < ApplicationController 
  before_action :authenticate_user!
  before_action :item_find
  before_action :bought
  before_action :dont_self_buy

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

  def bought
    item_find
    @orders = Order.all
      @orders.each do |order|
        if @item.id == order.item_id
          redirect_to root_path
        end
      end 
  end

  def dont_self_buy
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = "PAYJP_SECRET_KEY"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end
end
