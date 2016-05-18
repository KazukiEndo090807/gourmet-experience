Rails.application.routes.draw do

  devise_for :users
  root to: 'gourmets#index'
  get 'gourmet_info' => 'gourmets#index'
  get 'gourmet_info/restaurants' => 'gourmets#restaurants'
  get 'gourmet_info/new_restaurant' => 'gourmets#new_restaurant'
  post 'gourmet_info/restaurants' => 'gourmets#create'
  get 'gourmet_info/new' => 'gourmets#new'
  get 'users/:id'     =>  'users#show'

  delete 'gourmet_info/restaurants/:id'  =>  'gourmets#destroy'
  get 'gourmet_info/restaurants/:id/edit'   =>  'gourmets#edit'
  patch 'gourmet_info/restaurants/:id'  =>   'gourmets#update'
  get 'gourmet_info/restaurants/:id' => 'gourmets#show' #投稿詳細画面
  post 'gourmet_info/restaurants/:restaurant_id/comments' => 'comments#create'

  #ブックマーク機能
  post 'users/:id/bookmark'    =>   'users#favorite' #ブックマーキング機能の呼び出し
  get 'users/:id/bookmark' => 'users#bookmark' #ブックマークした投稿一覧画面

  #友人申請機能
  get 'gourmet_info/registered_users'  =>  'gourmets#registered_users'  #登録ユーザ一覧画面
  post 'gourmet_info/registered_users'  =>  'gourmets#friend_offer'
  get 'users/:id/friends'   =>  'users#friends'  #友人一覧表示画面
  get 'users/:id/announce'  =>   'users#announce'  #お知らせ表示画面
  post 'users/:id/announce'  =>  'users#friend_accept' #友人申請の承認

end
