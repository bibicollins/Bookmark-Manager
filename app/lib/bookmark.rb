require 'pg'
# fetches database from bookmarks
class Bookmark


  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      @con = PG.connect :dbname => 'bookmark_manager_test'
    else
      @con = PG.connect :dbname => 'bookmark_manager'
    end
    result = @con.exec "SELECT * FROM bookmarks"
    result.map { |bookmark| bookmark['url'] }
  end
    def self.save(bookmark)
      if ENV['ENVIRONMENT'] == 'test'
      @con = PG.connect :dbname => 'bookmark_manager_test'
      else
      @con = PG.connect :dbname => 'bookmark_manager'
    end
    @con.exec("INSERT INTO bookmarks (url) VALUES ('#{bookmark[:url]}')")
  end
end
