require_relative 'users.rb'

class UsersRepository

    def initialize
        @users = []
    end

    def create(user)
        sql = 'INSERT INTO users (email, username, name, password) VALUES ($1, $2, $3, $4);'
        params = [user.email, user.username, user.name, user.password]
        result = DatabaseConnection.exec_params(sql, params)
        return all[-1]
    end

    private

    def all
        sql = 'SELECT * FROM users'
        result = DatabaseConnection.exec_params(sql, [])

        result.each do |record|
            user = Users.new

            user.email = record['email']
            user.username = record['username']
            user.name = record['name']
            user.password = record['password']

            @users << user
        end
        return @users
    end
end