Rails.application.routes.draw do

  namespace :admin do
    get "/" => "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
  end

  scope module: :public do
    root 'homes#top'
    get '/about' => 'homes#about'
    resources :items, only: [:index, :show]
    resource :customers, only: [:show, :edit, :update]
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdrawal' => 'customers#withdrawal'
    delete '/cart_items/delete_all' => 'cart_items#delete_all'
    delete '/cart_items/:id' => 'cart_items#delete'
    resources :cart_items, only: [:index, :update, :delete, :create]
    get '/orders/thanks' => 'orders#thanks'
    post '/orders/confirm' => 'orders#confirm'
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
