require 'pg'
require './app/app.rb'
# fetches database from bookmarks
class Bookmark

  attr_reader :id, :url, :title
def initialize(id, url, title)
  @id = id
  @url = url
  @title = title
end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    result = con.exec "SELECT * FROM bookmarks"
    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def self.save(url, title)
    if ENV['ENVIRONMENT'] == 'test'
    con = PG.connect :dbname => 'bookmark_manager_test'
    else
    con = PG.connect :dbname => 'bookmark_manager'
    end
    result = con.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title")
    Bookmark.new(result.first['id'], result.first['url'], result.first['title'])
  end


   def self.delete(id)
      if ENV['ENVIRONMENT'] == 'test'
        con = PG.connect :dbname => 'bookmark_manager_test'
     else
        con = PG.connect :dbname => 'bookmark_manager'
      end
    result = con.exec("DELETE FROM bookmarks WHERE id = '#{id}' ")

   end

  def ==(other)
    @id == other.id
  end


end
