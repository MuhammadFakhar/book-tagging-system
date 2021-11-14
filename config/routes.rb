Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:index, :new, :create] do
    collection do
      post :search
    end
  end

  resources :tags, only: [:index, :new, :create]
  resources :book_tags, only: [:new, :create]

  root to: "books#index"
end
