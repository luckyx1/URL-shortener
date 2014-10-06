class Link < ActiveRecord::Base
	attr_accessible :url, :shorturl
	require 'net/http'
	require 'uri'
	validate :valid_link?

	after_create :shrink

	def valid_link?
		errors.add(:url, 'Must insert a url to shrink') if url.empty?

	    begin
	      #test first if the url is formatted right
	      #this causes users to check their url before inserting
	      uri = URI.parse(url)
	      #this method passing without errors is a basic check to see
	      #if url is valid
	      resp = uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
	      if url =~ /\A#{URI::regexp}\z/
	      	resp = true
	      else
	      	resp = false
	      end
	    rescue URI::InvalidURIError
	      resp = false
	    end
	    #urge users to formate url to fix their url
	    errors.add(:url,"Please use the format: http://#{url} or https://#{url}") unless resp
	    return resp 
	end

	def shrink 
		#use BCrypt to get a special hash that I don't create
		salt = BCrypt::Engine.generate_salt
      	short = BCrypt::Engine.hash_secret(url,salt)
      	shorturl = short.split(//).last(6).join
      	update_attribute(:shorturl,shorturl)
	end

	def to_param
		#to allow redirect to the right url
    	"#{shorturl}"
    end

end
