window.Napagram = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {

    console.log("hello from backbone")

    var feedCollection = new Napagram.Collections.UserFeed();
    feedCollection.fetch();

    var router = new Napagram.Routers.Router({
      $rootEl: $("#content")
      userFeed: feedCollection
    });

    Backbone.history.start();
  }
};
