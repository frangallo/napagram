Napagram.Views.CommentIndexItem = Backbone.View.extend({
  tagName: 'li'
  template: JST["media/comment_index"],

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
  },

  render: function(){
    this.$el.html(this.template({comment: this.model}));
    this.attachSubviews();
    return this;
  },

});
