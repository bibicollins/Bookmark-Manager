require_relative '../app/lib/bookmark'
require 'pg'
describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks in an array' do
    con = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.save(url: 'http://makersacademy.com')
    Bookmark.save(url: 'http://destroyallsoftware.com')
    Bookmark.save(url: 'http://google.com')

    expected_bookmarks = [
      'http://makersacademy.com',
      'http://destroyallsoftware.com',
      'http://google.com'
    ]

    expect(Bookmark.all).to eq expected_bookmarks
    end
  end
  describe '.save' do
    it 'saves a new bookmark' do
      Bookmark.save(url: 'http://youtube.com')
      expect(Bookmark.all).to include('http://youtube.com')
    end
  end
end
