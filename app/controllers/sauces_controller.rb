class SaucesController < ApplicationController
  before_action :is_admin

  def upsert
    if params[:id] != nil
      sauce = Sauce.find(params[:id])
    else
      sauce = Sauce.new
    end

    params[:tags].each do |tag|
      newTag = SauceTag.find(tag)
      sauce.sauce_tags << newTag
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
      tags: sauce.sauce_tags
    }}

    render json: {
      success: true,
      sauces: sauces,
      total: Sauce.count,
    }, status: 200
  end

  def delete
    sauce = Sauce.find(params[:id])

    if sauce.destroy
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
