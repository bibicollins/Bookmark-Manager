require './app/app.rb'

feature 'Delete a bookmark' do
  scenario 'Users can delete bookmarks' do
    Bookmark.save('http://makersacademy.com', 'Makers')
    visit '/'
    click_button "View bookmarks"
    click_button(id: 'Makers')
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_content 'Makers'
  end
end
