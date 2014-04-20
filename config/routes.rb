Textpls::Application.routes.draw do
  resources :messages, :only => [:index, :new, :create, :show]

  root to: 'messages#index'
end
