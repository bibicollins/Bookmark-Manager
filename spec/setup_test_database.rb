require 'pg'
p 'Setting up database...'
con = PG.connect :dbname => 'bookmark_table_test'
con.exec("TRUNCATE bookmarks;")
