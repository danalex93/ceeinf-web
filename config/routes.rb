Rails.application.routes.draw do

  root 'static#index'
  get '/' => 'static#index'
  get 'acerca' => 'static#about', as: 'about'

  resources :users, path: 'usuarios'
  devise_for :users, path: '', :skip => [:registrations], path_names: { sign_in: 'conectate', sign_out: 'desconectate' }, controllers: { sessions: "users/sessions",  omniauth_callbacks: 'users/omniauth_callbacks' }
  
  match '/usuarios/:id/terminar_registro' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  resources :posts, path: 'noticias' do
    resources :comments, path: 'comentarios', only: [:create, :destroy]
  end

end
