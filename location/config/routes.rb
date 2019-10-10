# frozen_string_literal: true

Location::Engine.routes.draw do

resources :edits_location do
  collection {post :import}
end

end
