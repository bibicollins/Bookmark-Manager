require 'sinatra/base'
require 'sinatra/flash'
require './app/lib/bookmark'
require 'uri'
# Controller
class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :method_override, true
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    p Bookmark.all
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :new
  end

  post '/bookmarks' do
    if params['url'] =~ /\A#{URI::regexp(['http', 'https'])}\z/

    Bookmark.save(params['url'], params['title'])
    #Bookmark.title(title: params['title'])
    redirect '/'
    # p 'Form data submitted to the /bookmarks route!'
    else
    flash[:notice] = "You must submit a valid URL"
    redirect '/bookmarks/new'
    end
  end
  delete '/bookmarks/:id' do
    Bookmark.delete(params['id'])
    redirect '/bookmarks'
  end
  run! if app_file == $PROGRAM_NAME
end
