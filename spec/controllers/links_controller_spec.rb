require 'spec_helper'
require 'rails_helper'

describe LinksController do
  describe 'POST #create' do
  	context 'when url is invalid' do
	    it 'renders the page with error' do
	      url = create(:link)

	      post :create, session: { link: url.url}

	      expect(response).to render_template(:index)
	      expect(flash[:notice]).to match(/^ do not match/)
	    end
	end
  end
end