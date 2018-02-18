class GroceryItemsController < ApplicationController
  before_action :set_grocery_item, only: [:show, :update, :destroy]

  # GET /grocery_items
  def index
    @grocery_items = GroceryItem.all

    render json: @grocery_items
  end

  # GET /grocery_items/1
  def show
    render json: @grocery_item
  end

  # POST /grocery_items
  def create
    @grocery_item = GroceryItem.new(grocery_item_params)

    if @grocery_item.save
      render json: @grocery_item, status: :created, location: @grocery_item
    else
      render json: @grocery_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /grocery_items/1
  def update
    if @grocery_item.update(grocery_item_params)
      render json: @grocery_item
    else
      render json: @grocery_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /grocery_items/1
  def destroy
    @grocery_item.destroy
  end

  private
    def set_grocery_item
      @grocery_item = GroceryItem.find(params[:id])
    end

    def grocery_item_params
      params.require(:grocery_item).permit(:name, :acquired)
    end
end
