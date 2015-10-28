Napagram.Routers.Router = Backbone.Router.extend({
  initialize: function(options){
    this.$rootEl = options.$rootEl;
    this.feedCollection = options.userFeed
    // this.usersCollection = new Napagram.Collections.Users();
    // this.usersCollection.fetch();
  },

  routes: {
    "" : "feedIndex"
  },

  feedIndex: function(){
    var feedIndexView = new Napagram.Views.FeedIndex({
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
