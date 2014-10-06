# spec/features/user_creates_a_minilink_spec.rb

feature 'User creates a Small link' do
  scenario 'they use a valid url' do
    visit root_path
    fill_in 'link_url', with: 'http://www.internleague.com'
    click_button 'Create Link'
    assert page.has_content?('Link was successfully created'), "Link was invalid"
  end
  scenario 'user inputs an invalid url' do
  	visit root_path
  	fill_in 'link_url', with: 'www.internleague.com'
  	click_button 'Create Link'
  	assert page.has_content?("Please use the format:"), "Link is empty or valid"
  end
end