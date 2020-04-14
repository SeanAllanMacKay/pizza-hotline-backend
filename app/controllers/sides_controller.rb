class SidesController < ApplicationController
    before_action :is_admin

    def upsert
        side = Side.where(name: params[:name]).first_or_initialize()

        if(params[:tags])
        params[:tags].each do |tag|
            newTag = Tag.where(name: tag).first_or_create({
                name: tag
            })
            side.tags << newTag
        end
        end

        if side.update(
            name: params[:name],
            description: params[:description],
            price: params[:price],
            code: params[:code]
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
        side = Side.all.map { |side| {
            id: side[:id],
            name: side[:name],
            description: side[:description],
            price: side[:price],
            code: side[:code],
            tags: side.tags
        }}

        render json: {
            success: true,
            sides: side,
            total: Side.count,
        }, status: 200
    end

    def delete
    end
end
