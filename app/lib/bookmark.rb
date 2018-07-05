require 'pg'
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
      @con = PG.connect :dbname => 'bookmark_manager_test'
    else
      @con = PG.connect :dbname => 'bookmark_manager'
    end
    result = @con.exec "SELECT * FROM bookmarks"
    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def self.save(url, title)
    if ENV['ENVIRONMENT'] == 'test'
    @con = PG.connect :dbname => 'bookmark_manager_test'
    else
    @con = PG.connect :dbname => 'bookmark_manager'
  end
    #@con.exec("INSERT INTO bookmarks (url) VALUES ('#{bookmark[:url]}')")
    result = @con.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title")
    #result = @con.exec("INSERT INTO bookmarks (title) VALUES('#{title[:title]}') RETURNING title")
    Bookmark.new(result.first['id'], result.first['url'], result.first['title'])
    #result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url']) }
    end

  # def self.title(titles)
  #   if ENV['ENVIRONMENT'] == 'test'
  #   @con = PG.connect :dbname => 'bookmark_manager_test'
  #   else
  #   @con = PG.connect :dbname => 'bookmark_manager'
  #   end
  #   p result = @con.exec("INSERT INTO bookmarks (title) VALUES('#{titles[:title]}') RETURNING title")
  # Bookmark.new(result.first['id'], result.first['url'], result.first['title'])
  # end


  def ==(other)
    @id == other.id
  end
end
