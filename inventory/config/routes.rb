# frozen_string_literal: true

Inventory::Engine.routes.draw do
resources :edits_inv do
  collection {post :import}
end

resources :edits_auin do
  collection {post :import}
end


get 'views' => 'views#index', as: 'views'
get 'get_inv_views' => 'views#get_inv_views', as: 'get_inv_views'



end
