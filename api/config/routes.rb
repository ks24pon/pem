Rails.application.routes.draw do
# ヘルスチェック
get '/health_check' => 'health_checks#index'
# 記事一覧
get '/articles' => 'articles#index'
#記事詳細 
get '/articles/:id' => 'articles#show'
#記事作成
post '/artciles' => 'articles#create'
end
