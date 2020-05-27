Rails.application.routes.draw do
  post 'api/news'
  get 'api/:date_1/:date_2', to: 'api#news_between'
  get 'api/create_news', to:'api#create_news'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post 'retweeets/:tweet_id', to: 'retweets#create', as: 'retweets'
  post 'likes/:tweet_id', to: 'likes#create', as: 'likes'

  devise_for :users, controllers: {
          sessions: 'users/sessions'
        }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tweets do
    collection do
      get :search_tweet
    end
  end

  get '/tweets/hashtag/:name', to: 'tweets#hashtags'
  root 'tweets#index'
end
