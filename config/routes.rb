Rails.application.routes.draw do
  devise_for :users
  root 'event#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :events do
    resource :attendances
    resource :charges
  end
  resource :users, only: [:show] do
    resource :avatars, only: [:create]
  end

=begin
  namespace :admin do
    root 'base#index'
    resource :users, except: [:show]
    resource :events
  end
=end
end
