class CrustTagsController < ApplicationController
    def upsert
        if params[:id] != nil
            tag = CrustTag.find(params[:id])
        else
            tag = CrustTag.new
        end

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
        tags = CrustTag.all.map { |crust| {
          id: crust[:id],
          name: crust[:name],
          description: crust[:description],
        }}

        render json: {
          success: true,
          crust_tags: tags,
          total: CrustTag.count,
        }, status: 200
    end
end
