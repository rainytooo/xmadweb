# encoding: utf-8
Xmadweb::Application.routes.draw do

  

  namespace :admin do
      root :to => "base#index"
      resources :users
  end
  # 学生功能管理
  resources :students do
    # 成绩管理
    resources :results
  end

  
  root :to => "home#index"
  
  devise_for :users

  resources :clicks

  resources :advertisements
  
  match "adclick", :to => "adclick#index", :via => [:get]


end
