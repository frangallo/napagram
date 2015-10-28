Napagram.Views.PostIndex = Backbone.CompositeView.extend({
  template: JST["media/feed_index"],

  initialize: function(){
    this.listenTo(this.collection, "sync remove add", this.render);
    this.collection.each(this.addPostIndexItemView.bind(this));
  },

  render: function(){
    this.$el.html(this.template());
    this.attachSubviews();
    return this;
  },

  addPostIndexItemView: function(postIndexItem){
  var subview = new Wandergram.Views.PostIndexItem({
    model: postIndexItem,
  });
  this.addSubview('.posts-container', subview);
},

});
