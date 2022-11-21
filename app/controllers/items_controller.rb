class ItemsController < ApplicationController
  def index
  
  end

  def new
    @item = Item.new
  end

  def create
    @item =Item.new(item_params)
    if @item.save
      redirecrt_to root_path
    else
      render :new
    end
  end



  private

  def item_params
    params.requier(:item).permit(:item_name,:explanation,:category_id,:item_status_id,:shipping_charges_id,:prefectures_id,:estimated_shipping_id,:image)
  end
end
