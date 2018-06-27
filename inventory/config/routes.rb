Inventory::Engine.routes.draw do

get 'views' => 'views#index', as: 'views'
get 'get_inv_views' => 'views#get_inv_views', as: 'get_inv_views'

end
