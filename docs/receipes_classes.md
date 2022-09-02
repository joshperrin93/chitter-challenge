Chitter Model and Repository Classes Design Recipe


2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

-- EXAMPLE
-- (file: spec/seeds_chitter.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE users, posts RESTART IDENTITY; 

INSERT INTO users (email, username, name, password) VALUES ('josh@email.com', 'josh123', 'Josh', 'Ch3l5e4');
INSERT INTO users (email, username, name, password) VALUES ('jade@email.com', 'jade987', 'Jade', 'N3wca5tl3')
INSERT INTO posts (message, time_posted, user_id) VALUES ('My first peep', '01-01-2022', 1);
INSERT INTO posts (message, time_posted, user_id) VALUES ('My second peep', '06-04-2022', 1);
INSERT INTO posts (message, time_posted, user_id) VALUES ('My last peep', '13-06-2022', 1);
INSERT INTO posts (message, time_posted, user_id) VALUES ('Holiday pics', '21-02-2022', 2);
INSERT INTO posts (message, time_posted, user_id) VALUES ('Carnival', '30-05-2022', 2);


Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

psql -h 127.0.0.1 chitter_test < seeds_chitter.sql

3. Define the class names

Posts
PostsRepository
Users
UsersRepository

4. Implement the Model class

^^DONE

5. Define the Repository Class interface


class PostsRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT * FROM Posts;

    # Returns an array of Posts made on Chitter but with the most recent at the top.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find_post time(id)
    # Executes the SQL query:
    # SELECT time_posted FROM posts WHERE id = $1;

    # Returns a single Post object's time.
  end

  # Add more methods below for each operation you'd like to implement.

  def create(post)
    # INSERT INTO posts (message, time_posted, user_id) VALUES ($1, $2, $3);
  end
end

class UsersRepository

  def create(post)
    # INSERT INTO users (email, username, name, password) VALUES ($1, $2, $3, $4);
  end

end

6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES

# 1
# Get all posts

repo = PostsRepository.new

Posts = repo.all

posts.length # =>  5

# 2
# Get all posts in order
posts[0].message # =>  'My first peep'
posts[0].time_posted # =>  '2022-01-01'
posts[0].user_id # =>  1

posts[1].message # =>  'Holiday pics'
posts[1].time_posted # =>  '2022-02-08'
posts[1].user_id # =>  2

posts[2].message # =>  'My second peep'
posts[2].time_posted # =>  '2022-04-21'
posts[2].user_id # =>  1

posts[3].message # =>  'Carnival'
posts[3].time_posted # =>  '2022-05-30'
posts[3].user_id # =>  2

posts[4].message # =>  'My last peep'
posts[4].time_posted # =>  '2022-06-17'
posts[4].user_id # =>  1

7. Reload the SQL seeds before each test run


def reset_chitter_table
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PostsRepository do
  before(:each) do 
    reset_chitter_table
  end

  # (your tests will go here).
end
8. Test-drive and implement the Repository class behaviour