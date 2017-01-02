class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)

    if @item.save
      flash[:notice] = "Your Todo Saved."
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = "There was a problem, try again."
      render :new
    end

  end

  def edit
  end

  def update
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item '#{@item.name}' was deleted."
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = "There was a Error deleting your Item."
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
