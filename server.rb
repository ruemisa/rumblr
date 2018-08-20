require 'sinatra'
require 'sinatra/activerecord'
require 'date'
enable :sessions

set :database, "sqlite3:rumblr.sqlite3"


# landing with sign-in form
get '/' do
    $users = User.all
    $posts = Post.all
    $comments = Comment.all
    erb :home
end

##### LOGIN #####

# login access
post '/' do
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
        password: params['password'],
        allegiance: params['allegiance']
    )
    user.save
    p user
    redirect :profile
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
post '/' do
    # do posting to local function here
    # do something conditional here to write to the correct local forum
    p params
    post = Post.new(
        post_title: params['title'],
        post_content: params['content'],
        # create_at: Date.strptime(post.created_at, '%d-%m-%Y'),
        # update_at: Date.strptime(post.updated_at, '%d-%m-%Y')
    )
    post.save
    redirect :local
end

# Accessing global forum
get '/global' do
    erb :global
end

# Posting to global forum
get '/addpost' do
    erb :addpost
end

post '/addpost' do
    # some posting capabilities here
    p user = session[:user]
    p params
    post = Post.new(
        post_title: params['title'],
        author: user['username'],
        post_category: params['category'],
        post_content: params['content']
    )
    post.save
    p post
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

# SETTINGS PAGE 

get '/settings' do
    erb :settings
end

require './models'