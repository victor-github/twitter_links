require 'rubygems'
require 'twitter'
require 'set'

# Initialize a Twitter search
search = Twitter::Search.new

#returns array of last 100 tweets containing the hashtag passed as argument
tweets = search.hashtag(ARGV[0]).per_page(100).fetch

#set containing all the unique URLS
unique_urls = Set.new

#filter out URLs, and add to set  
tweets.each {|t| unique_urls << t.text.scan(/http[^\s]+/) }

#display all urls
unique_urls.each { |u| puts u }

