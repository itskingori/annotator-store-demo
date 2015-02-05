Rails.application.routes.draw do
  # Home page for the Annotator Engine
  root 'pages#index'

  # Devise
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions', passwords: 'users/passwords' },
                     path: 'account',
                     path_names:  { sign_in: 'login', sign_out: 'logout', sign_up: 'signup', edit: 'profile' }

  # Create annotator store endpoints on our Rails app that are provided for by
  # the annotatore-store gem.
  mount AnnotatorStore::Engine, at: '/annotator_store'

  # Token endpoint for AnnotatorJS Auth plugin using JWT
  get '/auth/token', to: 'tokens#fetch'
end
