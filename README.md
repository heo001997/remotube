# Remotube Overview

This is Remotube a video sharing platform

* Ruby version: 2.7.2

* Rails version: 6.1.1

# Project strategy

### Simple + Fast + On point

* This project Backend skeleton is based on Rails API-only, Frontend is Vue 3.

* Authentication is simplified by NOT using Devise & skip email confirmation.

* Required features & Technical requirements is fulfilled. 

## Required features

### Register & Login

* Controller name: UsersController

* path: app/controllers/users_controller.rb

### Share movie & See movie list

* Controller name: VideosController

* path: app/controllers/videos_controller.rb

## Technical requirements

### Use Git and commit often
 
* Outcome: Only have 1 commit now.

* Reason: My commit history is not clean, because I'm doing features and bug fixing on the way => amend to 1 clean commit is still better than a bunch of dirty/incorrect commit.

### Have integration test

* Result: Done

* Sample: spec/controllers/users_controller_spec.rb

### Have unit test

* Result: Done

* Sample: spec/model/user_spec.rb

## Decisions

### Gems

* pry: debugging supporter.

* rubocop: syntax convention (I use default config for saving time).

* bcrypt: Oauth2 simulation.

* kaminari: simple paging in video_list.

* faraday: get youtube video statistics (with Youtube API v3).

* rspec-rails: for testing.

* faker: generate sample for rspec tests.

* factory_bot_rails: create better & reusable test sample.

* database_cleaner-active_record: support clean DB after run rspec tests.

### Coding feature / structure

* Afraid of not having enough time, I changed do manual Oauth2 (cutoff everything but access_token).  

* Use credentials to save my Youtube API v3 KEY (to get Youtube video statistics).

* Create constants.rb in initializers for global constant better managements.

* Create app/service folder to manage services.

## Contact

* Comments and feedbacks are welcome.

* Keep in touch by email here [Tu Ricky](nguyentientu44.dev@gmail.com), or [by my LinkedIn](https://www.linkedin.com/in/tu-ricky/).

## License

* This code is free to use under the terms of the MIT license.
