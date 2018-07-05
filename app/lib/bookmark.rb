require 'pg'
# fetches database from bookmarks
class Bookmark
  attr_reader :id, :url
def initialize(id, url)
  @id = id
  @url = url
end
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      @con = PG.connect :dbname => 'bookmark_manager_test'
    else
      @con = PG.connect :dbname => 'bookmark_manager'
    end
    result = @con.exec "SELECT * FROM bookmarks"
    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url']) }
  end

  def self.save(options)
    if ENV['ENVIRONMENT'] == 'test'
    @con = PG.connect :dbname => 'bookmark_manager_test'
    else
    @con = PG.connect :dbname => 'bookmark_manager'
  end
    #@con.exec("INSERT INTO bookmarks (url) VALUES ('#{bookmark[:url]}')")
    result = @con.exec("INSERT INTO bookmarks (url) VALUES('#{options[:url]}') RETURNING id, url")
    Bookmark.new(result.first['id'], result.first['url'])
    #result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url']) }
    end

  def ==(other)
    @id == other.id
  end 
end
