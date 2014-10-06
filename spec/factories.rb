# To test out factories in console, start with
#   rails console --sandbox
# and in console say
#   include FactoryGirl::Syntax::Methods
# You can then say stuff like
#  task = create(:task)
FactoryGirl.define do
	factory :link do |f|
		f.sequence(:url) {|n| "https://#{n}.com"}
	end
	factory :invalid_link do |f|
		f.sequence(:url) {|n| "#{n}.com"}
	end
end