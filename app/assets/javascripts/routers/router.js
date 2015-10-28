Napagram.Routers.Router = Backbone.Router.extend({
  initialize: function(options){
    this.$rootEl = options.$rootEl;
    this.postCollection = options.postCollection
    this.usersCollection = new Napagram.Collections.Users();
    this.usersCollection.fetch();
  },

  routes: {
    "" : "feed_show"
  },

  feed_show: function(){
    var feedShowView = new Napagram.Views.FeedShow({
      collection: this.postCollection
    });
    this._swapView(feedShowView);
  },

  _swapView: function (view) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(view.$el);
    view.render();
  }
});
