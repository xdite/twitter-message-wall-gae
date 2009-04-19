$LOAD_PATH << File.join(Dir.getwd, 'lib')
require 'rubygems'
require 'sinatra'
require 'twitter_search'
require 'bumble'
require 'activesupport'
require 'will_paginate/array'
require 'will_paginate/view_helpers'
require 'lib/view_helpers'
get '/' do
  @client = TwitterSearch::Client.new 'politweets'
  @results = @client.query :q => '@MrIE6'
  
  unless params[:page]  
    @results.each do |result|
        tweet = Tweet.find(:tweet_id => result.id )
        unless tweet 
          tweet = Tweet.create(:tweet_id => result.id , :text => result.text ,:from_user  => result.from_user,:to_user =>result.to_user,:from_user_id =>  result.from_user_id,:to_user_id => result.to_user_id,:created_at  => result.created_at ,:profile_image_url =>result.profile_image_url,:iso_language_code =>result.iso_language_code)
        end
     end
  end
  @tweets = Tweet.all.paginate(:page => params[:page], :per_page => 10)
  
  erb :home
end 

class Tweet 
  include Bumble
  ds :tweet_id, :text, :from_user, :to_user , :from_user , :to_user_id , :from_user_id , :created_at , :profile_image_url , :iso_language_code
end

include TweetMessage::ViewHelpers
include WillPaginate::ViewHelpers