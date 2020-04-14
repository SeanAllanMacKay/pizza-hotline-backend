class ToppingsController < ApplicationController
  before_action :is_admin

  def upsert
    if params[:id] != nil
      topping = Topping.find(params[:id])
    else
      topping = Topping.new
    end

    params[:tags].each do |tag|
      newTag = ToppingTag.find(tag)
      topping.topping_tags << newTag
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

  def get
    toppings = Topping.all.map { |topping| {
      id: topping[:id],
      name: topping[:name],
      description: topping[:description],
      tags: topping.topping_tags
    }}

    render json: {
      success: true,
      toppings: toppings,
      total: Topping.count,
    }, status: 200
  end

  def delete
    topping = Topping.find(params[:id])

    if topping.destroy
      render json: {
        success: true,
      }, status: 200
    else
      render json: {
        success: false,
      }, status: 500
    end
  end
end
