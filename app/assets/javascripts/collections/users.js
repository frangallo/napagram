Napagram.Collections.Users = Backbone.Collection.extend({
  url: 'api/users',
  model: Napagram.Models.User,

  getOrFetch: function(id){
    var collection = this;
    var user = collection.get(id);

    if (!user){
      user = new Napagram.Models.User({ id: id });
      collection.add(user);
      user.fetch({
        error: function(){ collection.remove(user); }
      })
    } else {
      user.fetch();
    }
    return user;
  },

});
