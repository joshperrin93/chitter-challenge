require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do 
    include Rack::Test::Methods

    let(:app) { Application.new }

    context 'GET to /posts' do
        it 'returns 200 OK' do
            response = get("/posts")
            expect(response.status).to eq(200)
        end

        it 'returns all posts' do
            response = get("/posts")
            expect(response.body).to include('<h1>News Feed</h1>')
            #expect(response.body).to include('<p>josh123</p>')
            expect(response.body).to include('<p>Holiday pics</p>')
            expect(response.body).to include('<p>2022-01-01</p>')
        end
    end

end