require 'pg'
# fetches database from bookmarks
class Bookmark


  def self.all
    if ENV['RACK ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_table_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
      result = con.exec "SELECT * FROM bookmarks"
      result.map { |bookmark| bookmark['url'] }
    end
  end
