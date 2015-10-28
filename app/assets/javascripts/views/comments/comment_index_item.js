Napagram.Views.CommentIndexItem = Backbone.View.extend({
  tagName: 'li',
  template: JST["comments/comment_index_item"],

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
  },

  render: function(){
    this.$el.html(this.template({comment: this.model}));
    this.attachSubviews();
    return this;
  },

});
