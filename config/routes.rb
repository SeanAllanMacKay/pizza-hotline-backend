Rails.application.routes.draw do
  # User
  get "/user" => "users#get"
  post "/user" => "users#create"

  # Auth
  post "/login" => "authentication#login"

  # Toppings
  get "/toppings" => "toppings#get"
  post "/upsert-topping" => "toppings#upsert"

  # Sauces
  get "/sauces" => "sauces#get"
  post "/upsert-sauce" => "sauces#upsert"

  # Sauces
  get "/crusts" => "crusts#get"
  post "/upsert-crust" => "crusts#upsert"
end
