Rails.application.routes.draw do
  get 'restaurants/redirect_to_random'
  get 'restaurants/redirect_to_random_vegan'
  get 'restaurants/home_page'
  get 'restaurants/about'
  get 'restaurants/restaurants'
  resources :restaurants

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'restaurants#home_page'
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'restaurants/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: restaurant.id)
  #   get 'restaurants/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :restaurants

  # Example resource route with options:
  #   resources :restaurants do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :restaurants do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :restaurants do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/restaurants/* to Admin::restaurantsController
  #     # (app/controllers/admin/restaurants_controller.rb)
  #     resources :restaurants
  #   end
end
