# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "top_pages#show"
  resource :bio_page, only: %i[show]
  resources :video_pages, only: %i[new index create edit update destroy]
  resource :live_calendar_page, only: %i[show]
  resources :live_pages, only: %i[index new create edit update destroy]
  resource :contact_page, only: %i[new create]
  resources :cd_pages
  resources :song_pages, only: %i[edit update destroy]
  resources :news_pages
  devise_scope :admin do
    get '/admins/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
end
