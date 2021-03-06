window.Napagram = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Mixins: {},

  initialize: function() {

    var feedCollection = Napagram.Collections.feed;
    feedCollection.fetch();
    var usersCollection = new Napagram.Collections.Users();
    usersCollection.fetch();

    var router = new Napagram.Routers.Router({
      $rootEl: $("#content"),
      userFeed: feedCollection
    });

    var header = new Napagram.Views.Header({
      router: router,
      collection: usersCollection
    });

    $("#header").html(header.render().$el);

    Backbone.history.start();
  }
};
