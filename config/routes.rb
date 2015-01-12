Rails.application.routes.draw do

  root 'static#index'
  get '/' => 'static#index'
  get 'acerca' => 'static#about', as: 'about'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  
  resources :users, path: 'usuarios'
  match '/usuarios/:id/terminar_registro' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  resources :posts, path: 'noticias' do
    resources :comments, path: 'comentarios', only: [:create, :destroy]
  end

end
