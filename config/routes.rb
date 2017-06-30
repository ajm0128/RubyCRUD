Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'home/index'
  post 'home/create'
  get 'home/destroy/:id' => 'home#destroy'
  get 'home/read/:id' => 'home#read'
  get 'home/update/:id' => 'home#update'
  get 'home/real_update/:id' => 'home#real_update'
  get 'home/read/:post_id/comment_create' => 'home#comment_create'
  get 'home/read/:id/comment_destroy/:post_id' => 'home#comment_destroy'
  get 'home/read/:post_id/reply_create' => 'home#reply_create'
  get 'home/write'
  get 'home/read/:id/reply_update/:post_id' => 'home#reply_update'
  get '/home/read/:id/reply_real_update/:post_id' => 'home#reply_real_update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
