$LOAD_PATH << File.join(Dir.getwd, 'lib')
require 'rubygems'
require 'sinatra'
require 'twitter_search'
 
get '/' do
  @client = TwitterSearch::Client.new 'politweets'
  @tweets = @client.query :q => '@MrIE6'
  
  erb :home
end 
