Napagram.Routers.Router = Backbone.Router.extend({
  initialize: function(options){
    this.$rootEl = options.$rootEl;
    this.feedCollection = options.userFeed
    // this.usersCollection = new Napagram.Collections.Users();
    // this.usersCollection.fetch();
  },

  routes: {
    "" : "postIndex"
  },

  postIndex: function(){
    console.log(this.feedCollection.length)
    var feedIndexView = new Napagram.Views.PostIndex({
      collection: this.feedCollection
    });
    this._swapView(feedIndexView);
  },

  _swapView: function (view) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(view.$el);
    view.render();
  }
});
