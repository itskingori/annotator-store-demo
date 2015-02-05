Rails.application.routes.draw do
  devise_for :users
  # Home page for the Annotator Engine
  root 'pages#index'

  # Create annotator store endpoints on our Rails app that are provided for by
  # the annotatore-store gem.
  mount AnnotatorStore::Engine, at: '/annotator_store'

  # Token endpoint for AnnotatorJS Auth plugin using JWT
  get '/auth/token', to: 'tokens#fetch'
end
