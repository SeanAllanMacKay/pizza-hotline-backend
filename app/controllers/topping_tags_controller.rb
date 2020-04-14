class ToppingTagsController < ApplicationController
    def upsert
        tag = ToppingTag.where(name: params[:name]).first_or_initialize()

        if tag.update(
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
        tags = ToppingTag.all.map { |topping| {
          id: topping[:id],
          name: topping[:name],
          description: topping[:description],
        }}

        render json: {
          success: true,
          topping_tags: tags,
          total: ToppingTag.count,
        }, status: 200
    end
end
