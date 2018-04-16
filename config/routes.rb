Rails.application.routes.draw do

  root 'hand_writings#index'
  resources :hand_writings do
    collection do
      post 'upload_image'
      get 'show_image_data'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
