require './app/app.rb'

feature 'adding bookmarks' do
  scenario 'Saving a new bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://yahoo.com')
    fill_in('title', with: 'Yahoo')
    click_button 'Save'
    click_button 'View bookmarks'
    expect(page).to have_content('Yahoo')
  end
  scenario 'User enters an invalid url' do
    visit('/bookmarks/new')
    fill_in('url', with: 'asdfsdf')
    fill_in('title', with: 'invalid url')
    click_button 'Save'
    expect(page).to have_content "You must submit a valid URL"
  end
end
