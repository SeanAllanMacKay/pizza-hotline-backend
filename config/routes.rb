Rails.application.routes.draw do
  ####################################################
  # User
  ####################################################
    get "/user" => "users#get"
    post "/user" => "users#create"

  ####################################################
  # Auth
  ####################################################
    post "/login" => "authentication#login"

  ####################################################
  # Pizzas
  ####################################################
    get "/pizza-sizes" => "pizza_sizes#get"
    post "/upsert-pizza-size" => "pizza_sizes#upsert"
    delete "/delete-pizza-size" => "pizza_sizes#delete"

    ####################################################
    # Toppings
    ####################################################
      get "/toppings" => "toppings#get"
      post "/upsert-topping" => "toppings#upsert"
      delete "/delete-topping" => "toppings#delete"

      get "/topping-tags" => "topping_tags#get"
      post "/upsert-topping-tag" => "topping_tags#upsert"

    ####################################################
    # Sauces
    ####################################################
      get "/sauces" => "sauces#get"
      post "/upsert-sauce" => "sauces#upsert"
      delete "/delete-sauce" => "sauces#delete"

      get "/sauce-tags" => "sauce_tags#get"
      post "/upsert-sauce-tag" => "sauce_tags#upsert"

    ####################################################
    # Sauces
    ####################################################
      get "/crusts" => "crusts#get"
      post "/upsert-crust" => "crusts#upsert"
      delete "/delete-crust" => "crusts#delete"

      get "/crust-tags" => "crust_tags#get"
      post "/upsert-crust-tag" => "crust_tags#upsert"

  # Sides
  get "/sides" => "sides#get"
  post "/upsert-side" => "sides#upsert"

  # Drinks
  get "/drinks" => "drinks#get"
  post "/upsert-drink" => "drinks#upsert"
end
