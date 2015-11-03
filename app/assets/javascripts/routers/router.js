Napagram.Routers.Router = Backbone.Router.extend({
  initialize: function(options){
    this.$rootEl = options.$rootEl;
    this.feedCollection = options.userFeed
    this.usersCollection = new Napagram.Collections.Users();
    this.usersCollection.fetch();
  },

  routes: {
    "" : "postIndex",
    "users/:id" : "userShow",
    "upload" : "uploadPost"
  },

  postIndex: function(){
    var feedIndexView = new Napagram.Views.PostIndex({
      collection: this.feedCollection
    });
    this._swapView(feedIndexView);
  },

  userShow: function(id){
    var user = this.usersCollection.getOrFetch(id);
    var userShowView = new Napagram.Views.UserShow({
      model: user
    });
    this._swapView(userShowView);
  },

  uploadPost: function(){
    var uploadPostView = new Napagram.Views.PostForm({
      model: new Napagram.Models.Medium(),
      collection: this.feedCollection
    });
    this._swapView(uploadPostView);
  },

  _swapView: function (view) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(view.$el);
    view.render();
  }
});
