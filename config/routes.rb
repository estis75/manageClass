Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'timetable#index'

  get 'users/new'
  post 'users/new', to: 'users#create'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#new'

  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  delete 'logout', to: 'session#destroy'

  get 'timetable', to: 'timetable#index'
  post 'timetable', to: 'timetable#index'
  get 'timetable/edit', to:'timetable#edit'
  post 'timetable/edit', to:'timetable#edit'
  get 'timetable/edit/:day/:th', to:'timetable#form'
  patch 'timetable/edit/:day/:th', to:'timetable#form'
  post 'timetable/edit/:day/:th', to:'timetable#createClassinfo'
  patch 'timetable/form', to:'timetable#form'
#  get 'timetable/formtable', to:'timetable#createClasstable'
  
  resources :users
  
end
