# README
You should be able to bundle install, rake db:create, rake db:migrate, and then
bin/dev to run the app. The only possible issue is I live in postgresql and you
might want/need to change the database.yml file to match your setup.

I ran through all the different ways I could think of to use a Phlex component to return
the turbo frame that results in standard turbo-frame handling/processing.  In this
case, it's setting the automatic setting of the turbo-frame src attribute and 
triggering a Turbo.visit (setting the URL and updating the turbo cache). 

I do understand that turbo-frames are more or less a glorified:
```ruby
turbo_stream.update('frame_id', PhlexComponent.new(users: @users))
```
But there is a little turbo magic here and there that I think we would want to 
avoid losing if possible.

Each of the variations I tried are all in app/controllers/users_controller.rb.

# Of note:
```ruby
render UsersComponent.new(users: @users), layout: 'turbo_rails/frame'
```

Does work. But as commented in the code, it renders a bunch of 
tags (HTML, HEAD, BODY, etc) that are not present when compared to 
a stock
```ruby
render partial: 'rails_partial', collection: @users
```

At the the moment, don't these extra tags don't seem to break anything. But who
knows what the future holds as Turbo evolves.

Configuration info below:

* Ruby version: 3.3.0

* System dependencies: 
  * Nothing more than the standard Rails dependencies + Phlex

* Configuration
  * --database=postgresql
  * --CSS=tailwind
  * --javascript=esbuild

* Database creation
  * rake db:create

* Database initialization
    * rake db:migrate -- will add a couple of rows of data for testing

* How to run the test suite
  * No test

* Services (job queues, cache servers, search engines, etc.)
  * None

* Deployment instructions
