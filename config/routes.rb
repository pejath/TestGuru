# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'gurus', controllers: { sessions: 'sessions' },
             path_names: { sign_in: :login, sign_out: :logout }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tests#index'

  resources :contacts, only: %i[new create]

  resources :badges, only: :index
  get :achieved, controller: :badges

  resources :tests, only: %i[index show] do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      resources :gists, only: :create
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end
    resources :gists, only: :index
    resources :badges, shallow: true
  end
end
