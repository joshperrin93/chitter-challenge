TRUNCATE TABLE users, posts RESTART IDENTITY; 

INSERT INTO users (email, username, name, password) VALUES ('josh@email.com', 'josh123', 'Josh', 'Ch3l5e4');
INSERT INTO users (email, username, name, password) VALUES ('jade@email.com', 'jade987', 'Jade', 'N3wca5tl3');
INSERT INTO posts (message, time_posted, user_id) VALUES ('My first peep', '2022-01-01', 1);
INSERT INTO posts (message, time_posted, user_id) VALUES ('My second peep', '2022-04-21', 1);
INSERT INTO posts (message, time_posted, user_id) VALUES ('My last peep', '2022-06-17', 1);
INSERT INTO posts (message, time_posted, user_id) VALUES ('Holiday pics', '2022-02-08', 2);
INSERT INTO posts (message, time_posted, user_id) VALUES ('Carnival', '2022-05-30', 2);