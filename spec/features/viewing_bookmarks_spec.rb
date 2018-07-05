require 'pg'
require './app/app.rb'

feature 'Viewing Bookmarks' do
  scenario 'Seeing Bookmarks after clicking view' do

    con = PG.connect :dbname => 'bookmark_manager_test'

    Bookmark.save('http://makersacademy.com', 'Makers')
    Bookmark.save('http://destroyallsoftware.com', 'Destroy')
    Bookmark.save('http://google.com', 'Goog')
    visit '/'

    click_button 'View bookmarks'
    expect(page).to have_content('Makers')
    expect(page).to have_content('Destroy')
    expect(page).to have_content('Goog')
  end
end
