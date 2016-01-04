# Napagram

[Heroku link][heroku]

[heroku]: http://napagram.herokuapp.com


## Minimum Viable Product
Napagram is a Instagram clone built on Rails and Backbone. Users can:

- [X] Create accounts
- [X] Create sessions (log in)
- [X] Post Pictures & Change Picture Filters
- [X] Follow and unfollow users
- [X] Search for other users
- [X] Like and comment on pictures


## Implementation Timeline

### Phase 1: User Authentication, Posts Creation (~2 day)
I will implement a user authentication system in Rails. By the end of this phase, users will be able to create media posts.


### Phase 2: Viewing Posts (~2 days)
I will add API routes to serve media data as JSON, then add Backbone
models and collections that fetch data from those routes. By the end of this
phase, users will be able to view posts, all
inside a single Backbone app.


### Phase 3: Change Photo Filters (~1 day)
I plan to use third-party libraries to add functionality to the post upload so users can change the filters for each photo.


### Phase 4: Displaying Posts (~2 days)
I plan to use third-party libraries to add functionality to the 'Posts' views in this phase. By the end of this phase users will be able to comment and like posts.


### Phase 5: Searching for Users (~1 day)
Users will be able to search for other users by name. Using jQuery a search bar with display auto complete results based on the letters in the search bar.


### To Do (TBD)
- [ ] Heatmap showing the location of posts
- [X] User Profile
- [ ] Multiple sessions/session management
