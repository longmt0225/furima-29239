class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_user_eq_current_user?, only: [:edit, :update]

  def index
    @items = Item.all.order('id DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid? && @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :price, :description, :user, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :handling_time_id, :image
    )
          .merge(user_id: current_user.id)
  end

  def item_user_eq_current_user?
    @item = Item.find(params[:id])
    redirect_to root_path unless @item.user.id == current_user.id
  end
end
