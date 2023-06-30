Rails.application.routes.draw do
  # Top画面
  get '/' => 'articles#top', as: 'top'
  # 投稿一覧
  get '/articles/index' => 'articles#index'
  # 投稿画面
  get '/articles/new' => 'articles#new'
  # 投稿処理
  post '/articles' => 'articles#create'
  # 投稿詳細
  get '/articles/:id/show' => 'articles#show', as: 'articles_show'
  # 投稿編集
  get '/articles/:id/edit' => 'articles#edit', as: 'articles_edit'
  # 編集処理
  put '/articles' => 'articles#update', as: 'articles_update'
  # 投稿削除
  delete '/articles/:id/destroy' => 'articles#destroy', as: 'articles_destroy'
  # コメント処理
  post '/articles/:article_id/comments' => 'comments#create', as: 'articles_comments'
  # コメント削除
  delete '/articles/:article_id/comments/:id' => 'comments#destroy', as: 'comments_destroy'
  # 新規登録画面
  get '/signup/new' => 'users#new'
  # 登録処理
  post '/users' => 'users#create', as: 'users_create'
  # ユーザー詳細
  get '/users/:id/show' => 'users#show', as: 'my_users_show'
  # ユーザー編集
  get '/users/:id/edit' => 'users#edit', as: 'my_users_edit'
  # ユーザー編集機能
  put '/users' => 'users#update', as: 'my_users_update'
  # ユーザー関連
  # resources :users, only: [:index, :show, :create, :edit, :update, :destroy]
  # ログイン画面
  get '/login' => 'sessions#new'
  # ゲストログイン画面
  post '/guest_login' => 'guest_sessions#create'
  # ログイン処理
  post '/login' => 'sessions#create', as: 'login_create'
  # ログアウト処理
  delete '/logout' => 'sessions#destroy'
end
