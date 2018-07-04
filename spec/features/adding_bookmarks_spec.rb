require './app/app.rb'

feature 'adding bookmarks' do
  scenario 'Saving a new bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://yahoo.com')
    click_button 'Save'
    click_button 'View bookmarks'
    expect(page).to have_content('http://yahoo.com')
  end
  scenario 'User enters an invalid url' do
    visit('/bookmarks/new')
    fill_in('url', with: 'asdfsdf')
    click_button 'Save'
    expect(page).to have_content "You must submit a valid URL"
  end
end
