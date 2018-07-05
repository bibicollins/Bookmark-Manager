require_relative '../app/lib/bookmark'
require 'pg'
describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks in an array' do
    con = PG.connect(dbname: 'bookmark_manager_test')

    bookmark_1 = Bookmark.save('http://makersacademy.com', 'Makers')
    bookmark_2 = Bookmark.save('http://destroyallsoftware.com', 'Destroy')
    bookmark_3 = Bookmark.save('http://google.com', 'Google')

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
      bookmark = Bookmark.save('http://youtube.com', 'Youtube')
      #expect(Bookmark.all).to include('http://youtube.com')
      expect(Bookmark.all).to include bookmark
    end
  end
  describe '#==' do
    it 'two Bookmarks are equal if their IDs match' do
      bookmark_1 = Bookmark.new(1, 'http://testbookmark.com', 'Test')
      bookmark_2 = Bookmark.new(1, 'http://testbookmark.com', 'Test')
      expect(bookmark_1).to eq bookmark_2
    end
  end
end
