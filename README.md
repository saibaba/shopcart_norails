Intro
=====

Using Rake, ActiveRecord etc., without rails (no rails command used).

Using
=====

To run migrations

rake 

To rollback to previous version

rake VERSION=x

To remove everything in db

rake VERSION=0

When you change any existing migration script, rake won't pick it up. Need to first remove everything (rake VERSION=0) and run rake again.

Run minitests:
rake test

Run sqlite:
sqlite3 -line development.sqlite3 "select * from products"

Reference
=========

http://blog.aizatto.com/2007/05/27/activerecord-migrations-without-rails/

