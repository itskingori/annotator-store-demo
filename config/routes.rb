Rails.application.routes.draw do
  # Home page for the Annotator Engine
  root 'pages#index'

  # Devise
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions', passwords: 'users/passwords' },
                     path: 'account',
                     path_names:  { sign_in: 'login', sign_out: 'logout', sign_up: 'signup', edit: 'profile' }
  # Token endpoint for AnnotatorJS Auth plugin using JWT
  get '/account/me', to: 'users#me', defaults: { format: :json }
  get '/account/token', to: 'tokens#fetch', defaults: { format: :text }

  # Create annotator store endpoints on our Rails app that are provided for by
  # the annotatore-store gem.
  mount AnnotatorStore::Engine, at: '/annotator_store'
end
