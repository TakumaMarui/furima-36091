class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_residence = PurchaseResidence.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_residence = PurchaseResidence.new(purchase_params)
    if @purchase_residence.valid?
      @purchase_residence.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_residence).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
