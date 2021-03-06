# Ruby On Rails - API
##### Developed by: Mário Augusto (mario@greenmelon.com.br).

A simple API showing a simple relationship and post system with token authorization. 
For tests, can use this address: https://rails-api-tidy.herokuapp.com/auth/sign_in

### How to install:
  - First of all, go to project folder and then run: bundle install
  - After this, use: rake db:create, db:migrate, db:seed
  - And finally: rails s to start the server.

### End points:

  - POST: auth/sign_in : login in. 
  -- Parameters: {"email":"" , "password":""}
  - POST: /auth : create a new user.
   -- Parameters: {"email":"" , "password":"" , "password_confirmation":""}
  - GET: /relationships/list-followers : list all follwers.
  - POST: /relationships : create a new relationships
   -- Parameters: {"follower_id":"" , "followed_id":"" , status: ""}
  - POST: /relationships/accept : accept a relationships request.
  - POST: /relationships/reject : reject a relationships request.
  - GET: /board - list all messages. 
  - POST: /posts : create a new post.
  - PATCH/PUT : /posts/id : update a post.
  - DELETE : /posts/id : destroy a post.

### How to authenticate:
You can autheticate with a existing user (login: user1@user.com.br , password: 123mudar), or you can create a new user. If you are a existing user, you need to use the /auth end-point. If you got a successful message, you will recive a important information in the header, and you will need this information, to use anothers endpoint, because need authorization.

### Authentication headers example:
```sh
"access-token": "wwwww",
"token-type":   "Bearer",
"client":       "xxxxx",
"expiry":       "yyyyy",
"uid":          "zzzzz"
```

### Tests:
To run the tests, run this command below:
```sh
$ rake spec
```


### GEMS:
- gem 'rack-cors'
- gem 'devise_token_auth'
- gem 'omniauth'
- gem "awesome_print", require:"ap"
- gem 'rtask-db-drop-connections', '~> 1.0'
- gem 'will_paginate'
- gem 'api-pagination'
- gem 'rspec-rails', '~> 3.5'
- gem 'shoulda-matchers'