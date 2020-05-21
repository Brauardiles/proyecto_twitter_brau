Rails.application.routes.draw do
  post 'retweeets/:tweet_id', to: 'retweets#create', as: 'retweets'
  post 'likes/:tweet_id', to: 'likes#create', as: 'likes'

  devise_for :users, controllers: {
          sessions: 'users/sessions'
        }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tweets
  root 'tweets#index'
end
