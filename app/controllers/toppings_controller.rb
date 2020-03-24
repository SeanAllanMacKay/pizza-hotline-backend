class ToppingsController < ApplicationController
  before_action :is_admin

  #Creates if topping doesn't exist, updates if it does
  def upsert
    topping = Topping.where(name: params[:name]).first_or_initialize()

    params[:tags].each do |tag|
      newTag = Tag.where(name: tag).first_or_create({
        name: tag
      })
      topping.tags << newTag
    end

    if topping.update(
      name: params[:name],
      description: params[:description],
    )
      render json: {
        success: true,
      }, status: 200
    else
      render json: {
        success: false,
      }, status: 500
    end
  end

  #Gets paginated toppings. If name specified, returns topping with that name
  def get
    toppings = Topping.all.map { |topping| {
      id: topping[:id],
      name: topping[:name],
      description: topping[:description],
      tags: topping.tags
    }}

    render json: {
      success: true,
      toppings: toppings,
      total: Topping.count,
    }, status: 200
  end

  def delete
  end
end
