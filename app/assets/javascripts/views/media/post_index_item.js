Napagram.Views.PostIndexItem = Backbone.CompositeView.extend({
  tagName: 'li',
  template: JST["media/post_index_item"],


  initialize: function(){
    this.listenTo(this.collection, "sync remove add", this.render);
    var comments = this.model.comments();

    comments.each(function(comment){
      this.addCommentIndexView(comment);
    }).bind(this)

    this.listenTo(comments, "add", this.addCommentView);
    this.listenTo(this.model.like(), "change", this.render);
    this.listenTo(comments, "remove", this.removeCommentView);
    this.listenTo(this.model, "change:num_likes", this.render);
  },

  render: function(){
    this.$el.html(this.template({post: this.model}));
    this.attachSubviews();
    return this;
  },

  addCommentView


});
