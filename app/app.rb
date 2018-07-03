require 'sinatra'
require './app/lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/view' do
    @bookmarks = Bookmark.all
    p Bookmark.all
    erb :view

  end

  run! if app_file == $PROGRAM_NAME
end
