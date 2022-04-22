# [is0xBiVote](https://is0xbivote.web.app)
<p align="left">
  <img alt="Logo" src="demo/bivote-favicon.png" width="150" >

## Table of Contents
* [About the Application](#about-the-application)
* [Getting Started](#getting-started)
* [Usage](#usage)
* [Technology](#technology)
* [Developed By](#developed-by)

## About the Application

## Getting Started
- Install gems
  > Type in terminal: `bundle install`
- Initialize the local database
  > Type in terminal: `rake db:create`
- Create required tables
  > Type in terminal: `rake db:migrate`
- Execute the application
  > Type in terminal: `rails server`

## Usage
- **Authentication**
  - ***[POST] /login (auth#create)***:
  - ***[POST] /forgot-password (auth#rescue)***:
- **User**
  - ***[POST] /users (users#create)***:
  - ***[GET] /profile (users#info)***:
  - ***[PATCH] /profile (users#update)***:
- **Vote**
  - ***[GET] /vote-entries (votes#entry)***:
  - ***[GET] /vote/:id (votes#info)***:
  - ***[GET] /search-date/:date (votes#search_by_date)***:
  - ***[GET] /search-keyword/:keyword' (votes#search_by_keyword)***:
- **Vote Record**
  - ***[GET] /user-vote/:id (vote_records#info)***:
  - ***[PATCH] /user-vote/:id (ote_records#update)***:
- **Post**
  - ***[GET] /post/:id (posts#info)***:
  - ***[POST] /post/:id (posts#create)***:
  - ***[DELETE] /post/:id (posts#destroy)***:
- **Upvote**
  - ***[POST] /upvote/:id (upvotes#create)***:
  - ***[DELETE] /upvote/:id (upvotes#destroy)***:
  
## Technology
  
## Developed By
- The application is developed by _[is0xjh25 (Yun-Chi Hsiao)](https://is0xjh25.github.io)_ 
<br/>
<p align="left">
  <img alt="Favicon" src="demo/is0-favicon.png" width="250" >
