class PizzaSizesController < ApplicationController
    def upsert
        if params[:id] != nil
            size = PizzaSize.find(params[:id])
          else
            size = PizzaSize.new
          end

        if size.update(
          name: params[:name],
          code: params[:code],
          size: params[:size],
          topping_price: params[:topping_price]
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
        sizes = PizzaSize.all.map { |size| {
          id: size[:id],
          name: size[:name],
          code: size[:code],
          size: size[:size],
          topping_price: size[:topping_price]
        }}

        render json: {
          success: true,
          pizza_sizes: sizes,
          total: PizzaSize.count,
        }, status: 200
    end
end
