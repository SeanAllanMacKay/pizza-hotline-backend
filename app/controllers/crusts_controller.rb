class CrustsController < ApplicationController
  before_action :is_admin

  def upsert
    crust = Crust.where(name: params[:name]).first_or_initialize()

    if(params[:tags])
      params[:tags].each do |tag|
        newTag = Tag.where(name: tag).first_or_create({
          name: tag
        })
        crust.tags << newTag
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
      tags: crust.tags
    }}

    render json: {
      success: true,
      crusts: crusts,
      total: Crust.count,
    }, status: 200
  end

  def delete
  end
end
