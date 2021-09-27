class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
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
    @item = Item.find(params[:id])
    # @comment = comment.new 追加機能(コメント投稿機能)実装時にコメントアウト解除
    # @comments = @item.comments.includes(:user)
  end

  def edit
    item = Item.find(params[:id])
    if current_user != item.user
      redirect_to action: :index
    end
  end

  def update
    # item = Item.find(params[:id])
    # item.update(item_params)
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :description, :category_id, :condition_id,
      :delivery_fee_id, :prefecture_id, :shipping_day_id, :price, :image
    ).merge(user_id: current_user.id)
  end
end
