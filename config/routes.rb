Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pokemons#index'
  get '/pokemons', to: 'pokemons#index'
  # get 'pokemons/:id', to: 'pokemons#show'
  get 'pokemons/:id', to: 'pokemons#show', as: 'pokemon'
end
