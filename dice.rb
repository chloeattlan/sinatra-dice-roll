require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get '/dice/2/6/' do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  erb(:two_six)
end


get '/dice/2/10/' do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
"<h1>2d10</h1>
  <a href=\"/\">back to main screen</a>
   <p>#{outcome}</p>"
end

get '/dice/1/20/' do
  first_die = rand(1..20)
  sum = first_die
	
  @outcome = "You rolled a #{first_die} for a total of #{sum}."
	
  erb(:one_twenty)
end

get("/dice/5/4") do
  first = rand(1..4)
  second = rand(1..4)
  third = rand(1..4)
  fourth = rand(1..4)
  fifth = rand(1..4)
  sum = first + second + third + fourth + fifth
	
  outcome = "You rolled a total of #{sum}."
	
  "<h1>5d4</h1>
  <a href=\"/\">back to main screen</a>
   <p>#{outcome}</p>"
end
