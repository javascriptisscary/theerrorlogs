== README

#TheErrorLogs.com

A blog/social platform for aspiring developers.

Ruby Version 2.2.2
Rails Version 4.2.3
Postgres DB

##Current Features:

* full-featured blogging with WYSMIHTML5 editor

* Followers/Following

* Updates Page with latest posts

* User Search

* User signup/login with Devise

* Friendly Ids with friend_id

* Image upload with Paperclip to AWS

* Profile page with list of Recent Posts and Comments

* Pagination with willpaginate

* Authorization with CanCanCan

* Written with a combination of TDD/BDD practices.

* Minimal design focused on readablity

* Responsive




## New Features to be Implemented

####See a bug anywhere?
Report it and then go try and fix it yourself! ;)

####Private Messaging
User can send a message to another user

####Tags Words
That link to a page listing all post with that same Tag word

####Code Class
Find a way to allow the user to insert computer code into a blog post that looks like it's in a code-editor.

####Read-more button.
For larger posts that are listed on a page, add a read more button.

#### Next and Previous Post buttons
On the Post Show Page

####Image uploads to AWS for blog posts
Currently only for profile pics.


##Functionality to be Implemented

####See a bug anywhere?
Report it and then go try and fix it yourself! ;)

####More Ajax
There are multiple forms and places that need to be converted into Ajax for better performance.

####Links inside of blog posts should be blue
Currently they are black, same as the rest of the site

####Add name to top of post under title
Currently only shown at the bottom of the post

#####Allow Blog owner to erase any comment on own post
Currently Admin or comment owner can erase, but not the owner of the post. 



##Design

####Condensed logo for Navbar
After login

####Better NavBar
We need a better solution for the "updates" button on the navbar



## BUGS

####Currently we have 2 tests I don't know how to write.
./spec/features/introduction_spec.rb:1
./spec/features/post_images_responsive_spec.rb:15

####And a 3rd of a feature we have yet to implement
./spec/controllers/comments_controller_spec.rb:70

####JS typeerror

####When writing a new post or editing it..
It just doesn't quite feel right. Probably some extra JS running somewhere.

####Friend_id
When signing in (perhaps signing up as well), it doesn't use friendly ids

####See a bug?
Write it up and try and fix it yourself!




#DEVELOPERS GUIDE

A caveat before we get started. This repository is made for helping CareerFoundry students/graduates (and myself) to learn GitHub and open source type projects.
Although we love everybody, we're hoping to keep it mostly to CareerFoundry people. If you really want to help anyway, send an email to kennethgould@javascriptisscary.com thanks!




##GET THE SOURCE CODE

Theerrorlogs is hosted at GitHub and uses Git for source control. In order to obtain the source code, you must first install Git on your system. Instructions for installing and setting up Git can be found at https://help.github.com/articles/set-up-git.

If you simply want to create a local copy of the source to play with, you can clone the main repository using this command:

git clone git://github.com/javascriptisscary/theerrorlogs.git

If you're planning on contributing to Theerrorlogs, then it's a good idea to fork the repository. You can find instructions for forking a repository at https://help.github.com/articles/fork-a-repo. After forking Theerrorlogs repository, you'll want to create a local copy of your fork.

This page is also a great resource for contributing to open-source https://guides.github.com/activities/contributing-to-open-source/


##TEST, TEST, TEST

This blog was initally created to learn how to do both TDD and BDD techniques. Then it became this. Go figure ;)
Anyway, the point is here we're sticking with that philosphy. We always make/run tests and we make sure the tests pass. Before uploading anything make sure you run `bundle exec rspec` inside of your rails console and everything passes. Also make sure your own components are well tested with rSpec and capybara (it's a good learning experience!) They will not be accepted otherwise.


##BASICS
 
Always create your own branch.

Comment more than you think you need to. (A failing of mine in this current iteration, as I didn't set out with this being open-source.)

Check to make sure everthing added is responsive for mobile and desktop.

If you don't know... ask! We'll figure it out together.
