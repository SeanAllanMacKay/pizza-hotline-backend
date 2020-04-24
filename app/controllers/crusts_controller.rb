class CrustsController < ApplicationController
  before_action :is_admin

  include Rails.application.routes.url_helpers

  def upsert
    if params[:id] != nil
      crust = Crust.find(params[:id])
    else
      crust = Crust.new
    end

    if(params[:tags] != nil)
      newTags = JSON.parse params[:tags]

      crust.crust_tags.each do |tag|
        if !newTags.include?(tag)
          crust.crust_tags.delete(tag)
        end
      end

      newTags.each do |tag|
        newTag = CrustTag.find(tag)

        if !crust.crust_tags.include?(newTag)
          crust.crust_tags << newTag
        end
      end
    end

    if params[:sizes] != 'null'
      newSizes = JSON.parse params[:sizes]

      crust.pizza_sizes.each do |size|
        if !newSizes.include?(size)
          crust.pizza_sizes.delete(size)
        end
      end

      newSizes.each do |size|
        newSize = PizzaSize.find(size)

        if !crust.pizza_sizes.include?(newSize)
          crust.pizza_sizes << newSize
        end
      end
    end

    if params[:image] != nil
      crust.image.attach(params[:image])
    end

    if crust.update(
      name: params[:name],
      description: params[:description],
    )
      render json: {
        success: true,
      }, status: 200
    else
      render json: {
        success: false
      }, status: 500
    end
  end

  def get
    crusts = Crust.all.map { |crust| {
      id: crust[:id],
      name: crust[:name],
      description: crust[:description],
      tags: crust.crust_tags,
      sizes: crust.pizza_sizes,
      image: crust.image.attached? ? crust.image.key.to_s : nil
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
