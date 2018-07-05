require_relative '../app/lib/bookmark'
require 'pg'
describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks in an array' do
    con = PG.connect(dbname: 'bookmark_manager_test')

    bookmark_1 = Bookmark.save(url: 'http://makersacademy.com')
    bookmark_2 = Bookmark.save(url: 'http://destroyallsoftware.com')
    bookmark_3 = Bookmark.save(url: 'http://google.com')

    expected_bookmarks = [
      bookmark_1,
      bookmark_2,
      bookmark_3
    ]

    expect(Bookmark.all).to eq expected_bookmarks
    end
  end
  describe '.save' do
    it 'saves a new bookmark' do
      bookmark = Bookmark.save(url: 'http://youtube.com')
      #expect(Bookmark.all).to include('http://youtube.com')
      expect(Bookmark.all).to include bookmark
    end
  end
end
