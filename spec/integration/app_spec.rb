require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do 
    include Rack::Test::Methods

    let(:app) { Application.new }

    context 'GET to /posts' do
        it 'returns 200 OK' do
            response = ('/posts')

            expect(response.status).to eq(200)
        end
    end

end