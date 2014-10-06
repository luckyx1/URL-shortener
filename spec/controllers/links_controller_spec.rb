require 'spec_helper'

describe LinksController, type: :controller do
  describe 'POST #create' do
  	context 'when url is valid' do
	    it 'renders the page with the shorturls' do
  		  post 'create' , link: {:url=>"https://test.com"} 
	      expect(flash[:notice]).to match("Link was successfully created.")
	    end
	end
	context 'when trying to create using invalid url' do
		it 'renders the error' do
			expect{create(:invalid_link)}.to raise_error
		end
	end
  end
end