Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :lists, only: %i[index new create show] do
    resources :bookmarks, only: %i[new create destroy]
  end
end

# lists/movie_id
