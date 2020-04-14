class DrinksController < ApplicationController
    before_action :is_admin

    def upsert
        drink = Drink.where(name: params[:name]).first_or_create({
            name: params[:name],
            description: params[:description],
        })

        if(params[:sizes])
            params[:sizes].each do |size|

                newSize = Size.where(name: size[:name]).first_or_create({
                    name: size[:name],
                    code: size[:code] ? size[:code] : nil
                })

                DrinksSize.where(drink: drink, size: newSize).first_or_create({
                    drink: drink,
                    size: newSize,
                    price: size[:price],
                })
            end
        end

        if(params[:tags])
            params[:tags].each do |tag|
                newTag = Tag.where(name: tag).first_or_create({
                    name: tag
                })
                drink.tags << newTag
            end
        end

        if drink.update(
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

        drinks = Drink.includes(:drinks_sizes).all.uniq.map { |drink| {
            id: drink[:id],
            name: drink[:name],
            description: drink[:description],
            tags: drink.tags,
            sizes: drink.sizes
        }}

        render json: {
            success: true,
            drinks: drinks,
            total: Drink.count,
        }, status: 200
    end

    def delete
    end
end
