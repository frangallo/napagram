Napagram.Collections.UserFeed = Backbone.Collection.extend({
  url: 'api/media/feed',
  model: Napagram.Models.Medium,

  getOrFetch: function(id){
    var collection = this;
    var medium = collection.get(id);

    if (!medium){
      medium = new Napagram.Models.Medium({ id: id });
      collection.add(medium);
      user.fetch({
        error: function(){ collection.remove(medium); }
      })
    } else {
      medium.fetch();
    }
    return medium;
  },

});
