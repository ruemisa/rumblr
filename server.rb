require 'sinatra'
require 'sinatra/activerecord'
require 'date'
enable :sessions

require 'active_record'

set :database, "sqlite3:rumblr.sqlite3"
# ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

# landing with sign-in form
get '/' do
    # $comments = Comment.all
    erb :home
end

##### LOGIN #####

# login access
post '/' do
    @email = params['email']
    @given_password = params['password']
    # do rest of login function here
    @user = User.find_by(email: @email)
    if @user.password == @given_password
        session[:user] = @user
        redirect :profile
    else
        p "Invalid Credentials"
        redirect :error
    end
end

##### SIGN UP #####

# sign up page 
get '/signup' do
    erb :signup
end

# sign up access
post '/signup' do
    p params
    # do sign up function here
    @user = User.new(
        first_name: params['first_name'],
        last_name: params['last_name'],
        username: params['username'],
        email: params['email'],
        birthday: Date.parse(params['birthday']),
        password: params['password'],
        allegiance: params['allegiance']
    )   
    
    @user.save 
    $users = User.all

    if @user.save 
        session[:user] = @user
        redirect :profile
    else
        redirect '/'
    end
end

##### LOG OUT #####

get '/logout' do
    # do log out function here
    session[:user] = nil
    session.clear
    p "user has logged out"
    redirect '/'
end

##### PROFILE #####

# Profile Page
get '/profile' do
    
    $styling = ''
    allegiance = session[:user].allegiance
    
    if allegiance == 'air'
        $styling = 'air.css'
    elsif allegiance == 'fire'
        $styling = 'fire.css'
    elsif allegiance == 'water'
        $styling = 'water.css'
    elsif allegiance == 'earth'
        $styling = 'earth.css'
    else
        p 'YOU ARE THE AVATAR'
    end
    p $styling 
    erb :profile
end

##### POST #####

# Accessing local forum
get '/local' do
    $posts = Post.all
    #do something conditional here to access the right local forum
    if $posts == nil
        redirect :profile
    else
        erb :local
    end
end

# Accessing global forum
get '/global' do
    $posts = Post.all

    if $posts == nil
        redirect :profile
    else
        erb :global
    end
end

# Posting to forums
get '/addpost' do
    erb :addpost
end

post '/addpost' do
    # some posting capabilities here
    @user = session[:user]
    p params
    @post = Post.new(
        post_title: params['title'],
        author: @user['username'],
        theme: @user['allegiance'],
        image_url: params['image_url'],
        post_category: params['category'],
        post_content: params['content'],
        user_id: @user['id']
    )
    @post.save
    $posts = Post.all

    if @post.post_category == 'local'
        redirect :local
    elsif @post.post_category == 'global'
        redirect :global
    else 
        p 'No Posts Available'
        redirect :profile
    end
end

# SETTINGS ROUTE

get '/settings' do
    erb :settings
end

# DELETING ACCOUNT

get '/delete' do
    erb :delete
end

post '/delete' do
    current_user = session[:user].id
    user = User.find_by(id: current_user)
    user_post = Post.where(user_id: current_user)
    user_post.each do |post|
        p "Posts Deleted"
        post.destroy
    end
    p "User Destroyed"
    user.destroy
    session.clear
    redirect '/'
end


# ERRORS 

get '/error' do
    erb :error
end

# SEARCH USERS

get '/profile/user' do
    erb :profile
end

post '/profile/user' do

    user = User.where(params['username'].downcase)


    redirect '/profile/user'
end






require './models'

