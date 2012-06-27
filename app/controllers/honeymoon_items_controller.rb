class HoneymoonItemsController < ApplicationController
  # GET /honeymoon_items
  # GET /honeymoon_items.json
  def index
    @honeymoon_items = HoneymoonItem.search
    render json: @honeymoon_items
  end
end
