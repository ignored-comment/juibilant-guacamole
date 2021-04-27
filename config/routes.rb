Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/plots', to: 'plots#index'
  delete '/plots', to: 'harvests#destroy', as: 'remove_this_plant'

  get '/gardens/:id', to: 'gardens#show'
end
