require 'users_repository'
require 'database_connection'

def reset_chitter_table
    seed_sql = File.read('spec/seeds_chitter.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
end

RSpec.describe UsersRepository do

    before(:each) do 
        reset_chitter_table
    end

    context '#create' do
        it 'creates a new user' do
            new_users = Users.new

            new_users.email = 'will@gmail.com'
            new_users.username = 'williamg'
            new_users.name = 'Will'
            new_users.password = 'd0rm4N'

            repo = UsersRepository.new
            create_user = repo.create(new_users)

            expect(create_user.email).to eq('will@gmail.com')
            expect(create_user.username).to eq('williamg')
            expect(create_user.name).to eq('Will')
            expect(create_user.password).to eq('d0rm4N')
        end
    end
end