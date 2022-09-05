require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/posts_repository'
require_relative 'lib/users_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/users_repository'
    also_reload 'lib/posts_repository'
  end

  get '/posts' do
    repo_post = PostsRepository.new
    @news_feed = repo_post.all
    return erb(:all_posts)
  end

end