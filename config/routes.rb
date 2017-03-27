# frozen_string_literal: true

Rails.application.routes.draw do
  resources :reports, except: [:new, :edit]
  resources :sessions, except: [:new, :edit]
  resources :observations, only: [:index, :show, :destroy, :update, :create]
  resources :students, except: [:new, :edit]
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
  get '/students/:student_id/sessions/:session_id/observations' => 'observations#index'
  post '/students/:student_id/sessions/:session_id/observations' => 'observations#create'
  get '/students/:student_id/sessions' => 'sessions#index'
  post '/students/:student_id/sessions' => 'sessions#create'
  get '/students/:student_id/sessions/:session_id/reports' => 'reports#index'
  post '/students/:student_id/sessions/:session_id/reports' => 'reports#create'
end
