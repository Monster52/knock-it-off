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
      redirect_to root_path
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
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
