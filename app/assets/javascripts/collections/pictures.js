Napagram.Collections.Pictures = Backbone.Collection.extend({
  url: 'api/pictures',
  model: Napagram.Models.Picture,

  getOrFetch: function(id){
    var collection = this;
    var picture = collection.get(id);

    if (!picture){
      picture = new Napagram.Models.Picture({ id: id });
      collection.add(picture);
      picture.fetch({
        error: function(){ collection.remove(picture); }
      })
    } else {
      picture.fetch();
    }
    return picture;
  },
});

Napagram.Collections.pictures = new Napagram.Collections.Pictures();
