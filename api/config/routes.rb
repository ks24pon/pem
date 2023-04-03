Rails.application.routes.draw do
# Top画面
get '/' => 'articles#top'
# 記事一覧
get '/articles/index' => 'articles#index'
# 記事投稿画面
get '/articles/new' => 'articles#new'
#記事作成
post '/articles' => 'articles#create'
end
