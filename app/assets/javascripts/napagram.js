window.Napagram = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {

    console.log("hello from backbone")

    var router = new Napagram.Routers.Router({
      $rootEl: $("#content")
    });
    
    Backbone.history.start();
  }
};
