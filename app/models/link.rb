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
	      resp = uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
	      if url =~ /\A#{URI::regexp}\z/
	      	resp = true
	      else
	      	resp = false
	      end
	      #try to see if you get a 200, its the most reliable to see if the url is valid
	      begin
	       @r = Net::HTTP.get_response(URI.parse(url))
	   	  rescue
	   	  	errors.add(:url,"This url does not point to anything valid")
	      end
  		
	    rescue URI::InvalidURIError
	      resp = false
	    end
	    #urge users to formate url to fix their url
	    errors.add(:url,"Please use the format: http://#{url} or https://#{url}") unless resp
	     
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
