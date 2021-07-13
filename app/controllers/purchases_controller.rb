class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  def index
    @purchase_residence = PurchaseResidence.new
    if @item.purchase.present?
      redirect_to root_path
    elsif @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @purchase_residence = PurchaseResidence.new(purchase_params)
    if @purchase_residence.valid?
      pay_item
      @purchase_residence.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_residence).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
