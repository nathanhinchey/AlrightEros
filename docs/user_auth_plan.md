#How to control user flow

##What everyone should see:

###Signed in users:
* See their username (and profile pic)
* See a 'log out' link

###Users who don't have a profile yet:
* Can only render the "create profile" view

###Users who have a profile:
* get full access to the site

##How to acheive it:
* Make a "current_user" model
* In '/api/session' include:
  1. User id
  2. User email
  3. current_user_has_profile? (defined in ApplicationController)
* If current_user_has_profile?
  - User has access to all pages normally
* Else (i.e. !current_user_has_profile?)
  - User can only access new profile page
