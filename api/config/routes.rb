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
  # ログイン画面
  get '/login' => 'sessions#new'
  # ログイン処理
  post '/login' => 'sessions#create', as: 'login_create'
  # ログアウト処理
  delete '/logout' => 'sessions#destroy'
end
