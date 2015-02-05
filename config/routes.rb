Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Create annotator store endpoints on our Rails app that are provided for by
  # the annotatore-store gem.
  mount AnnotatorStore::Engine, at: '/annotator_store'

  get '/auth/token', to: 'tokens#fetch'
end
