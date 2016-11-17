Rails.application.routes.draw do

  get 'notes/index'

  post 'notes/create'

  patch 'notes/update'

  delete 'notes/delete'

  get 'client/new'

  get 'client/:id' => 'clients#index'

  post 'client' => 'clients#new', as: 'new_client'

  get 'register' => 'registrations#new', as: 'register_user'

  post 'register' => 'registrations#new'

  get '/index' => 'registrations#index'

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new', as: 'sign_in'
  end

  # devise_scope :user do
  #   get 'therapist/sign_up', to: 'devise/registrations#new'
  # end

  get 'therapist/:id' => 'therapists#index'

  post 'therapist' => 'therapists#new', as: 'new_therapist'

# T- client page, id is id of the client
  get 'therapist/client/:id'    => 'therapists#show'

# Client calendar, id is client id
  get 'therapist/calendar/:id'  => 'therapists#calendar'

# A client's posts and surveys, id is client id
  get 'therapist/activity/:id'  => 'therapists#activity'

# Therapist profile, id is therapist
  get '/therapist/profile/:id' => 'therapists#t_profile'

# Client profile, id is client's id
  get 'therapist/c_profile/:id' => 'therapists#c_profile'


  devise_for :users
end
