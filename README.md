# Bookmark Manager

### User stories:

 As an avid bookmarker,
 so that I can see my bookmarks,
 I want it to show a list of bookmarks.

 As a dedicated bookmaker,
 so that I can keep track of my favourite pages,
 I want to be able to add new bookmarks.

## Entity Diagram
 ```graphviz
 digraph bookmarks {
     rankdir=LR;
     node[shape="box"]
     Bookmark_Manager
     User
     Account
     Bookmarks
     Bookmark_Manager -> User [arrowhead="crow"]
     User -> Account
     Account -> Bookmarks [arrowhead="crow"]

 }
 ```
