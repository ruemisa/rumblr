require 'sinatra'
require 'sinatra/activerecord'
require 'date'

set :database, "sqlite3:rumblr.sqlite3"


# landing with signup form
get '/' do
    erb :home
end

##### LOGIN #####

# login access
post '/login' do
    email = params['email']
    given_password = params['password']
    # do rest of login function here
    user = User.find_by(email: email)
    if user.password == given_password
        session[:user] = user
        redirect :profile
    else
        p "Invalid Credentials"
        redirect '/'
    end
end

##### SIGN UP #####

# sign up page just in case didn't use sign up form
get '/signup' do
    erb :signup
end

# sign up access
post '/signup' do
    p params
    # do sign up function here
    user = User.new(
        first_name: params['first_name'],
        last_name: params['last_name'],
        username: params['username'],
        email: params['email'],
        birthday: Date.parse(params['birthday']),
        password: params['password']
    )
    redirect '/'
end

##### LOG OUT #####

get '/logout' do
    # do log out function here
    session[:user] = nil
    p "user has logged out"
    redirect '/'
end

##### PROFILE #####

# Profile Page
get '/profile' do 
    erb :profile
end

# Profile Update
patch '/profile' do
    # do some profile function here
    redirect :profile
end

##### POST #####

# Accessing local forum
get '/local' do
    #do something conditional here to access the right local forum
    erb :local
end

# Adding new post to local forum
post '/local' do
    # do posting to local function here
    # do something conditional here to write to the correct local forum
    post = Post.new(
        post_title: params['title'],
        post_content: params['content'],
        create_at: Date.strptime(post.created_at, '%d-%m-%Y'),
        update_at: Date.strptime(post.updated_at, '%d-%m-%Y')
    )
    redirect :local
end

# Accessing global forum
get '/global' do
    erb :global
end

# Posting to global forum
post '/global' do
    # some posting capabilities here
    post = Post.new(
        post_title: params['title'],
        post_content: params['content'],
        create_at: Date.strptime(post.created_at, '%d-%m-%Y'),
        update_at: Date.strptime(post.updated_at, '%d-%m-%Y')
    )
    redirect :global
end

# ADDING EDITING CAPABILITIES TO POSTING TO FORUMS

patch '/local' do
    # some function
    redirect :local
end

patch '/global' do
    # some function
    redirect :global
end

require './models'