# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* 1.You need the ruby environment and rails environment and have a mysql data base.
* 2.Create new file.
* 3.In you terminal enter this file and in you terminal input git init next git pull this project in this file.
* 4.Create a new database.
* 5.Edit the file database.yml. Make sure that you can link the database that you builted.
* 6.In you terminal input bundle install and rake db:migrate.
* 7.In you terminal input rails s.
* 8.If everything is normal, in the terminal you'll see like this:</br>
   => Booting Puma</br>
   => Rails 5.0.7 application starting in development on http://localhost:3000</br>
   => Run `rails server -h` for more startup options</br>
   Puma starting in single mode...</br>
   Version 3.11.4 (ruby 2.3.1-p112), codename: Love Song</br>
   Min threads: 5, max threads: 5</br>
   Environment: development</br>
   Listening on tcp://localhost:3000</br>
   Use Ctrl-C to stop</br>
* 9.I was useing Postman to test run the APIs
* 10.You can create a new user for http://localhost:3000/api/v1/users/create_user receive json is:</br>
      {"email": "123123@qq.com"}
* 11.You can create a friend connection for http://localhost:3000/api/v1/users/create_friend_ship receive json is:</br>
      {"friends": [ "andy@example.com", "john@example.com"]}
* 12.You can retrieve friends list for http://localhost:3000/api/v1/users/find_friend_ship receive json is:</br>
      {"email": "123@qq.com"}
* 13.You can retrieve friends list between two email for http://localhost:3000/api/v1/users/find_friend_two_email receive json is:</br>
      {"friends": ["111@qq.com", "222@qq.com"]}
* 14.You can create new subscribe for http://localhost:3000/api/v1/users/create_subscribe_ship receive json is:</br>
      {"requestor": "123@qq.com","target": "john@qq.com"}
* 15.You can block updates for http://localhost:3000/api/v1/users/block_subscribe_friend receive json is:</br>
      {"requestor": "123@qq.com","target": "john@qq.com"}
* 16.You can retrieve emails that they can receive updates and is you friends for http://localhost:3000/api/v1/users/find_friend_subscribe receive json is:</br>
      {"sender": "123123@qq.com","text": "hello word john@qq.com"}
* 11.If you have any questions, please contact me</br>
* 12.My email is 18642844472@163.com. WeChat:18642844472. QQ:454276708. Telephone:86+411+18642844472</br>
Thank you for your review  I cherish this opportunity to give me a chance</br>
