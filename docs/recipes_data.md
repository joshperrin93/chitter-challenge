STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

#HARDER

#As a Maker
#So that only I can post messages on Chitter as me
#I want to log in to Chitter

#As a Maker
#So that I can avoid others posting messages on Chitter as me
#I want to log out of Chitter

#ADVANCED

#As a Maker
#So that I can stay constantly tapped in to the shouty box of Chitter
#I want to receive an email if I am tagged in a Peep

Notes on functionality:
 - You don't have to be logged in to see the peeps.
 - Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
 - The username and email are unique.
 - Peeps (posts to chitter) have the name of the maker and their user handle.

Database Nouns:
post, message, time

Actions:
Post
View

2. Infer the Table Name and Columns
Put the different nouns in this table. Replace the example with your own nouns.

Record	Properties
posts 	message, time
users   email, username, name, password

3. Decide the column types.

Table: posts
id: SERIAL
message: text
time_posted: date

Table: users
id: SERIAL
email: text
username: text
name: text
password: text



4. Decide on The Tables Relationship

To decide on which one, answer these two questions:

Can one post have many users? No
Can one user have many posts? Yes

You'll then be able to say that:

user has many posts
And on the other side, post belongs to user
In that case, the foreign key is in the table user

Replace the relevant bits in this example with your own:

# EXAMPLE

1. Can one artist have many albums? YES
2. Can one album have many artists? NO

-> Therefore,
-> An user HAS MANY posts
-> An post BELONGS TO a user

-> Therefore, the foreign key is on the posts table.

4. Write the SQL.
-- EXAMPLE
-- file: user_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  username text,
  name text,
  password text
);

-- Then the table with the foreign key first.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  message text,
  time_posted date,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);
5. Create the tables.
psql -h 127.0.0.1 database_name < albums_table.sql