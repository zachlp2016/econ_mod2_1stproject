Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :economists, only: [:index, :new, :create, :show]

  #
  # get '/economists', to: 'economists#index'

end
