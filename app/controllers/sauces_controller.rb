class SaucesController < ApplicationController
  before_action :is_admin

  def upsert
    sauce = Sauce.where(name: params[:name]).first_or_initialize()

    params[:tags].each do |tag|
      newTag = Tag.where(name: tag).first_or_create({
        name: tag
      })
      sauce.tags << newTag
    end

    if sauce.update(
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
    sauces = Sauce.all.map { |sauce| {
      id: sauce[:id],
      name: sauce[:name],
      description: sauce[:description],
      tags: sauce.tags
    }}

    render json: {
      success: true,
      sauces: sauces,
      total: Sauce.count,
    }, status: 200
  end

  def delete
  end
end
