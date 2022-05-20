class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.all)
  end

  def show
    if Item.exists?(params[:id])
      render json: ItemSerializer.new(Item.find(params[:id]))
    else
      render json: { data: { details: 'No item matches this id' } },
             status: 404
    end
  end

  def create
    render json: ItemSerializer.new(Item.create(item_params)), status: :created
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: ItemSerializer.new(item)
    else
      render status: 404
    end
  end

  def destroy
    item = Item.find(params[:id])
    render status: :no_content if item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end
end
