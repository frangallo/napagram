Napagram.Collections.Comments = Backbone.Collection.extend({
  url: 'api/commments',
  model: Napagram.Models.commment,

  getOrFetch: function(id){
    var collection = this;
    var comment = collection.get(id);

    if (!comment){
      comment = new Napagram.Models.Comment({ id: id });
      collection.add(comment);
      comment.fetch({
        error: function(){ collection.remove(comment); }
      })
    } else {
      comment.fetch();
    }
    return comment;
  },

});
