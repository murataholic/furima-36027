class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    # @comment = comment.new 追加機能(コメント投稿機能)実装時にコメントアウト解除
    # @comments = @item.comments.includes(:user)
  end

  def edit
    redirect_to action: :index if current_user != @item.user
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    redirect_to action: :index if @item.destroy
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :name, :description, :category_id, :condition_id,
      :delivery_fee_id, :prefecture_id, :shipping_day_id, :price, :image
    ).merge(user_id: current_user.id)
  end
end
