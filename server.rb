require 'sinatra'
require 'sinatra/activerecord'
require 'date'

set :database, "sqlite3:rumblr.sqlite3"


# landing with signup form
get '/' do
    erb :home
end

##### LOGIN #####

# login form
get '/login' do
    erb :login
end

# login access
post '/login' do
    email = params['email']
    give_password = params['password']
    # do rest of login function here
    redirect :profile
end

##### SIGN UP #####

# sign up page just in case didn't use sign up form
get '/signup' do
    erb :signup
end

# sign up access
post '/signup' do
    # do sign up function here
    redirect '/'
end

##### LOG OUT #####

get '/logout' do
    # do log out function here
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
    redirect :local
end

# Accessing global forum
get '/global' do
    erb :global
end

# Posting to global forum
post '/global' do
    # some posting capabilities here
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
