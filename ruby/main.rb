require 'sentry-ruby'

Sentry.init do |config|
  config.dsn = 'https://7bb0e18f77744dc69322e84f72e9769e@o87286.ingest.sentry.io/6227418'
  config.traces_sample_rate = 1.0
  config.traces_sampler = lambda do |sampling_context|
    true # can also return a float between 0.0 and 1.0
  end
end

# This must be imported after sentry-ruby for transactions to work
require "sinatra"
require "sinatra/cors"

set :allow_origin, "*"
set :allow_methods, "GET,HEAD,POST"
set :allow_headers, "content-type,if-modified-since,accept,access-control-request-headers,access-control-request-method,origin,sec-fetch-mode,user-agent,customerType,email,Referer,se,sec-ch-ua,sec-ch-ua-mobile,sec-ch-ua-platform,sentry-trace"

# This is for Auto Instrumenting the transaction
use Sentry::Rack::CaptureExceptions

# Parse Request Headers for setting customerType, se, backendType. not working
# https://github.com/sinatra/sinatra#rack-middleware
# before do
#   print "before"
# end

get "/" do
  "Sentry Ruby Service still says Hello - turn me into a microservice that powers Invoicing, Trucking, or DriverFind"
end

get "/api" do
  "ruby /api"
end

get "/connect" do
  "ruby /connect"
end

get "/organization" do
  "ruby /organization"
end

get "/success" do
  "ruby /success"
end