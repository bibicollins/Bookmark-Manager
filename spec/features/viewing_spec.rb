feature 'Viewing Bookmarks' do
  scenario 'Seeing Bookmarks after clicking view' do
    visit '/'
    click_button 'View bookmarks'
    expect(page).to have_content('http://testy.com')
  end
end
