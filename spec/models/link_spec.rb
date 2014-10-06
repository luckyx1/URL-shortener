require 'spec_helper'

describe Link do
	describe 'check if valid link' do
	    it 'should accept valid urls' do
			link = FactoryGirl.create(:link)
	    	# visit sign_up_path
	    	expect(link.valid_link?).to eq(true)
	    end
	end
	describe 'check if links are invalid' do
	    it 'should deny invalid urls' do
			expect{link = FactoryGirl.create(:invalid_link)}.to raise_error
	    	# visit sign_up_path
	    	expect{FactoryGirl.create(:invalid).valid_link.to eq(true)}
	    end
	end
end