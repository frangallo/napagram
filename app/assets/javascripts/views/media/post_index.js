Napagram.Views.PostIndex = Backbone.CompositeView.extend({
  template: JST["media/post_index"],

  initialize: function(){
    this.listenTo(this.collection, "add", this.addPostIndexItemView);
    this.listenTo(this.collection, "remove", this.removePostIndexItemView);
    this.collection.each(this.addPostIndexItemView.bind(this));
  },

  render: function(){
    this.$el.html(this.template());
    this.attachSubviews();
    return this;
  },

  addPostIndexItemView: function(postIndexItem){
    var subview = new Napagram.Views.PostIndexItem({
      model: postIndexItem
    });
    this.addSubview('.posts-index', subview);
  },

  removePostIndexItemView: function(postIndexItem){
    this.removeModelSubview('.posts-index', postIndexItem);
  },

});
