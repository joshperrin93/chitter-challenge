GET /posts Route Design Recipe Copy this design recipe template to test-drive a Sinatra route.

Design the Route Signature You'll need to include:
the HTTP method the path any query parameters (passed in the URL) or body parameters (passed in the request body)

Method: GET
Path: /posts

Design the Response Request
GET /posts
''''' 
Response (200 OK): 
'''''
josh123
My last peep
'2022-06-17'

jade987
Carnival
2022-05-30

josh123
My second peep
2022-04-21

jade987
Holiday pics
2022-02-08

josh123
My first peep
2022-01-01


Write Examples Replace these with your own design.
Request:
GET /posts

Expected response:
Response for 200 OK
include josh123
include Holiday pics
include 2022-01-01

EXAMPLE
file: spec/integration/application_spec.rb
require "spec_helper"

describe Application do include Rack::Test::Methods

let(:app) { Application.new }

context "GET /" do 
it 'returns 200 OK' do

  response = get('/posts)

  expect(response.status).to eq(200)

end
it 'returns all posts' do

  response = get('/posts)
  expect(response.body).to eq(expected_response)

end