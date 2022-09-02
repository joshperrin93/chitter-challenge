require 'posts_repository'
require 'database_connection'

def reset_chitter_table
    seed_sql = File.read('spec/seeds_chitter.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
end

RSpec.describe PostsRepository do

    before(:each) do 
        reset_chitter_table
    end

    context '#all' do
        it 'returns all posts' do
            repo = PostsRepository.new
            all_posts = repo.all
            
            expect(all_posts.length).to eq(5)
        end

        it 'Get all posts in order' do
            repo = PostsRepository.new
            posts = repo.all

            expect(posts[4].message).to eq('My first peep')
            expect(posts[4].time_posted).to eq('2022-01-01')
            expect(posts[4].user_id).to eq(1)

            expect(posts[3].message).to eq('Holiday pics')
            expect(posts[3].time_posted).to eq('2022-02-08')
            expect(posts[3].user_id).to eq(2)

            expect(posts[2].message).to eq('My second peep')
            expect(posts[2].time_posted).to eq('2022-04-21')
            expect(posts[2].user_id).to eq(1)

            expect(posts[1].message).to eq('Carnival')
            expect(posts[1].time_posted).to eq('2022-05-30')
            expect(posts[1].user_id).to eq(2)

            expect(posts[0].message).to eq('My last peep')
            expect(posts[0].time_posted).to eq('2022-06-17')
            expect(posts[0].user_id).to eq(1)
        end
    end

    context '#create' do
        it 'creates a new post' do
            new_post = Posts.new

            new_post.message = 'Posting right now'
            new_post.time_posted = '2022-09-02'
            new_post.user_id = 2

            repo = PostsRepository.new
            repo.create(new_post)
            all_posts = repo.all

            expect(all_posts[0].message).to eq('Posting right now')
            expect(all_posts[0].time_posted).to eq('2022-09-02')
            expect(all_posts[0].user_id).to eq(2)
        end
    end
end