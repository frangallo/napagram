Napagram.Views.PostIndex = Backbone.CompositeView.extend({
  template: JST["media/feed_index"],

  initialize: function(){
    this.listenTo(this.collection, "sync remove add", this.render);
  },

  render: function(){
    this.$el.html(this.template({posts: this.collection}))
    return this;
  },

});
