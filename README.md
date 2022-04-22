# [is0xBiVote](https://is0xbivote.web.app)
<p align="left">
  <img alt="Logo" src="demo/bivote-favicon.png" width="150" >

## Table of Contents
* [About the Application](#about-the-application)
* [Getting Started](#getting-started)
* [Usage](#usage)
* [Deployment](#deployment)
* [Developed By](#developed-by)

## About the Application
_BiVote server_ is an api server which works for _BiVote_ application. It recieves requests via RESTful api, and it delivers data to frontend in JSON format. It supports the service of authentication with JSON Website Token (JWT) to ensure the security of the program. The JWT has time expiration which requires user to log in every day and the token is stored in the authorization section of the Header not in the body. Furthermore, the password would be hased by _Bcrypt_ before it stored into database to ensure the password would not be leaked if the database is haked. The encode key is saved in the environment file safely. Moreover, the Cross-Origin Resource Sharing (CORS) has been set properly to allow restricted resources on the page to be requested from the permitted domain. The setting increase the security level to some extents. 

## Getting Started
- Install gems
  > Type in terminal: `bundle install`
- Initialize the local database
  > Type in terminal: `rake db:create`
- Create required tables
  > Type in terminal: `rake db:migrate`
- Execute the application
  > Type in terminal: `rails server`
- Before start
  > Ensure PostgreSQL is installed and the server is executing.

## Usage
- **Authentication**
  - ***[POST] /login (auth#create)***: Require username and password, return a JWT if the user is verified.
  - ***[POST] /forgot-password (auth#rescue)***: Send a new password to user's email.
- **User**
  - ***[POST] /users (users#create)***: Create a new user.
  - ***[GET] /profile (users#info)***: Fetch a user information including account stat.
  - ***[PATCH] /profile (users#update)***: Update username or passoword.
- **Vote**
  - ***[GET] /vote-entries (votes#entry)***: Return 4 vote ids which are progressing.
  - ***[GET] /vote/:id (votes#info)***: Return current stat of the vote.
  - ***[GET] /search-date/:date (votes#search_by_date)***: Return the votes started in the last 90 days of the picked date.
  - ***[GET] /search-keyword/:keyword (votes#search_by_keyword)***: Return the votes which name or category contains the keyword.
- **Vote Record**
  - ***[GET] /user-vote/:id (vote_records#info)***: Fetch the user's vote record by vote id. If the record is not exist, create a new one.
  - ***[PATCH] /user-vote/:id (ote_records#update)***: Record the voting process.
- **Post**
  - ***[GET] /post/:id (posts#info)***: Fetch a post with poster, upvotes, and upvoted.
  - ***[POST] /post/:id (posts#create)***: Create a new post.
  - ***[DELETE] /post/:id (posts#destroy)***: Delete a post.
- **Upvote**
  - ***[POST] /upvote/:id (upvotes#create)***: Upvote a post by post id.
  - ***[DELETE] /upvote/:id (upvotes#destroy)***: Undo upvoteby post id
    
## Deployment
The server is hosting on Heroku and the stack is set to Heroku-18 to adapt the Ruby on Rails version. Also, the PostgreSQL database is deployed on Heroku.
  
## Developed By
- The application is developed by _[is0xjh25 (Yun-Chi Hsiao)](https://is0xjh25.github.io)_ 
<br/>
<p align="left">
  <img alt="Favicon" src="demo/is0-favicon.png" width="250" >
