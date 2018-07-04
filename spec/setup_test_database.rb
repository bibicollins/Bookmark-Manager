require 'pg'
p 'Setting up database...'

con = PG.connect :dbname => 'bookmark_manager_test'
con.exec("TRUNCATE bookmarks;")
