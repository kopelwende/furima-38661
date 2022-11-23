class ItemsController < ApplicationController
  before_action :go_to_index, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :item_status_id, :shipping_charges_id, :prefectures_id,
                                 :estimated_shipping_id, :price, :image).merge(user_id: current_user.id)
  end

  def go_to_index
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
