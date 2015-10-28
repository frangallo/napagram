Napagram.Views.PostIndexItem = Backbone.CompositeView.extend({
  tagName: 'li',
  template: JST["media/post_index_item"],


  initialize: function(){
    this.listenTo(this.collection, "sync remove add", this.render);
    this.collection.each(this.addPostIndexItemView.bind(this));
  },

  render: function(){
    this.$el.html(this.template());
    this.attachSubviews();
    return this;
  },


});
