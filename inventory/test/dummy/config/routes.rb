Rails.application.routes.draw do
  mount Inventory::Engine => "/inventory"
end
