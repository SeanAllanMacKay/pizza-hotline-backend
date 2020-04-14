class CrustsController < ApplicationController
  before_action :is_admin

  def upsert
    if params[:id] != nil
      crust = Crust.find(params[:id])
    else
      crust = Crust.new
    end

    if(params[:tags] != nil)
      params[:tags].each do |tag|
        newTag = CrustTag.find(tag)
        crust.crust_tags << newTag
      end
    end

    if params[:sizes] != nil
      params[:sizes].each do |size|
        newSize = PizzaSize.find(size)
        crust.pizza_sizes << newSize
      end
    end

    if crust.update(
      name: params[:name],
      description: params[:description]
    )
      render json: {
        success: true,
      }, status: 200
    else
      render json: {
        success: false
      }, status: 200
    end
  end

  def get
    crusts = Crust.all.map { |crust| {
      id: crust[:id],
      name: crust[:name],
      description: crust[:description],
      tags: crust.crust_tags,
      sizes: crust.pizza_sizes
    }}

    render json: {
      success: true,
      crusts: crusts,
      total: Crust.count,
    }, status: 200
  end

  def delete
    crust = Crust.find(params[:id])

    if crust.destroy
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
