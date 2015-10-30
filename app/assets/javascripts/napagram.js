window.Napagram = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Mixins: {},

  initialize: function() {

    console.log("hello from backbone")

    var feedCollection = new Napagram.Collections.UserFeed();
    feedCollection.fetch();
    var usersCollection = new Napagram.Collections.Users();
    var usersCollection.fetch();

    var router = new Napagram.Routers.Router({
      $rootEl: $("#content"),
      userFeed: feedCollection
    });

    var header = new Napagram.Views.Header({
      router: router,
      collection: userCollection
    });

    $("#header").html(header.render().$el);

    Backbone.history.start();
  }
};
