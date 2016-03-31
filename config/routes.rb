Rails.application.routes.draw do
  resources :tags, only: [:index, :show, :create, :update, :destroy], defaults: { format: :json }
  resources :places, only: [:index, :show, :create, :update, :destroy], defaults: { format: :json }
  match '/places/by_tags/:tags', to: 'places#by_tags', via: :get, as: :places_by_tags
  match '/places/by_tag_names/:tags', to: 'places#by_tag_names', via: :get, as: :places_by_tag_names
  match '/places/tag', to: 'places#tag', via: :post, as: :places_tag
end
