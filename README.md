# AVATAR - R-umblr #

**Avatar** is a Full-stack social media blog platform that allows users to sign up, create posts, and read other users' posts. 

## Table of Contents ##

1. Project Link and Description
1. Technologies Used
1. Installation
1. Components
1. Author's Notes
1. Credits
1. Author

#### Project Link ####

The project is deployed live on heroku. Link to the project is: https://rumblr-ruel.herokuapp.com/ 

Basically, you can sign up and choose an allegiance/team when signing up. This is important as it will dictate the look and functionality of your webpage. If you do not wish to sign up, below are some emails and passwords for testing. 

Login               | Password
--------------------| --------
nomad@gmail.com     | 111111
azula@email.com     | 111111
spitfire@email.com  | 111111
hailey@email.com    | 111111
boulder@email.com   | 111111
toph@email.com      | 111111
moonlady@email.com  | 111111

#### Technologies Used ####

The following are the technologies used to accomplish this project:

* Ruby
* Sinatra
* Heroku
* PostgreSQL (production)
* SQLite3 (development)
* ActiveRecord
* CSS3

#### Installation ####

If you wish to use the following files, you will need the following:

* Ruby
https://rubyinstaller.org/downloads/

* Bundler
``` {r engine='sh'}
$ gem install bundler
```
The rest are located at the Gemfile. 
You will need that Bundler gem to install all of the dependencies needed for this project. 

#### Components ####

* Landing Page
  This contains the login page and a link to the sign up page, if you are not a member yet. 
* Sign Up Page
  You will need to input the required details to be able to use the services. It will redirect you to your profile page. 
* Profile Page
  Here, you will be able to see your profile pic, name, birthday, and your 3 recent posts.
* Settings Page 
  Inside this page, you will be able to edit your account (first and last name, and allegiance) or delete your account. 
* Local and Global Community Tabs
  * Local : This is not visibile to members of other allegiances. Only your specific community can see this.
  * Global : You will be able to see users who post here regardless of allegiance.
* New Post Tab
  * This will take you to the addpost page which will allow you to create a post. You can add a title, photo url (web only),     content, and lets you choose whether to post it on the global community or your local one. 
 
#### Author's Notes ####
 
Currently, the upload profile image under the profil pic is still disabled. The other pages on the tabs below are still disabled.

Still planning to add a profile search functionality, as well as alert prompts for users to let them know if they have logged out, deleted their account successfully, edited their profile successfully, and if someone posted recently (still thinking of how I would execute this properly). For now, there is an error page (you can try inputing the wrong password and it will appear). 

#### Credits ####

Here are the sources for the images I used throughout the page:

The hd element images

https://wall.alphacoders.com/big.php?i=212516

Community.jpg 

zerochan » Avatar: The Last Airbender
Entry by IȻhigo Kurosaki on Wed Dec 17 07:49:46 2014.


Four-benders.jpg 

https://www.pixelstalk.net/hd-avatar-the-last-airbender-backgrounds/

profile_placeholder

https://vault.lootcrate.com/products/avatar-last-airbender-loot-pin-from-loot-crate


world map

http://charlesdoddwhite.me/avatar-the-last-airbender-world-map.html/

#### Author ####

Ruel Alfonso Misa
