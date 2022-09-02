require_relative 'posts.rb'

class PostsRepository 
    def initialize
        @posts = []
    end

    def all
        sql = 'SELECT * FROM posts;'
        result = DatabaseConnection.exec_params(sql, [])

        result.each do |record|
            post = Posts.new

            post.id = record['id']
            post.message = record['message']
            post.time_posted = record['time_posted']
            post.user_id = record['user_id'].to_i

            @posts << post
        end
        return @posts.sort_by! { |x| x.time_posted }.reverse
    end

    def create(post)
        sql = 'INSERT INTO posts (message, time_posted, user_id) VALUES ($1, $2, $3);'
        params = [post.message, post.time_posted, post.user_id]
        result = DatabaseConnection.exec_params(sql, params)
    end
end