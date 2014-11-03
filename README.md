
Annotator Store Demo App
========================

Installation
------------

Create new Rails app ...

    $ rails new 'myappname' --database=postgresql --skip-bundle

Once done, add this line to your application's Gemfile (installs the latest):

    gem 'annotator-store'

Or to be more specific with the version, something like this:

    gem 'annotator-store', '~> 0.2.0'

And then from your app root execute:

    $ bundle install

Configure your database credentials in `config/database.yml` and then run the
migrations to create the tables to store the annotations:

    $ rake annotator_store:install:migrations
    $ rake db:migrate

Require the gem, I did this in `config/application.rb`:

    require 'annotator_store'

Then mount it in `config/routes.rb`:

    # Configures store endpoint in your app
    mount AnnotatorStore::Engine, at: '/annotator_store'

Now it should be ready for use.

Run your app using `rails server` and you'll see all the endpoints will be available at
`http://0.0.0.0:3000/annotator_store` in your app.


Routes
------

Routes available in your app should be something like this (run `rake routes`) ...

             Prefix Verb URI Pattern      Controller#Action
    annotator_store      /annotator_store AnnotatorStore::Engine

    Routes for AnnotatorStore::Engine:
           root GET     /                          annotator_store/pages#index {:format=>:json}
         search GET     /search(.:format)          annotator_store/pages#search {:format=>:json}
                OPTIONS /search(.:format)          annotator_store/annotations#options {:format=>:json}
    annotations OPTIONS /annotations(.:format)     annotator_store/annotations#options {:format=>:json}
     annotation OPTIONS /annotations/:id(.:format) annotator_store/annotations#options {:format=>:json}
                POST    /annotations(.:format)     annotator_store/annotations#create {:format=>:json}
                GET     /annotations/:id(.:format) annotator_store/annotations#show {:format=>:json}
                PATCH   /annotations/:id(.:format) annotator_store/annotations#update {:format=>:json}
                PUT     /annotations/:id(.:format) annotator_store/annotations#update {:format=>:json}
                DELETE  /annotations/:id(.:format) annotator_store/annotations#destroy {:format=>:json}
