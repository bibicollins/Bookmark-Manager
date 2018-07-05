require 'pg'
require './app/app.rb'

feature 'Viewing Bookmarks' do
  scenario 'Seeing Bookmarks after clicking view' do

    con = PG.connect :dbname => 'bookmark_manager_test'

    Bookmark.save(url: 'http://makersacademy.com', title: 'Makers')
    Bookmark.save(url: 'http://destroyallsoftware.com', title: 'Destroy')
    Bookmark.save(url: 'http://google.com', title: 'Goog')
    visit '/'

    click_button 'View bookmarks'
    expect(page).to have_content('http://makersacademy.com')
    expect(page).to have_content('http://destroyallsoftware.com')
    expect(page).to have_content('http://google.com')
  end
end
