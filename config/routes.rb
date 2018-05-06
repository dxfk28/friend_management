Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users do
        collection do
          post :create_friend_ship
          post :find_friend_ship
          post :find_friend_two_email
          post :create_subscribe_ship
          post :block_subscribe_friend
          post :create_user
          post :find_friend_subscribe
        end
      end
    end
  end
end
