class SauceTagsController < ApplicationController
    def upsert
        sauce = SauceTag.where(name: params[:name]).first_or_initialize()

        if sauce.update(
          name: params[:name]
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
        tags = SauceTag.all.map { |sauce| {
          id: sauce[:id],
          name: sauce[:name],
          description: sauce[:description],
        }}

        render json: {
          success: true,
          sauce_tags: tags,
          total: SauceTag.count,
        }, status: 200
    end
end
