Napagram.Views.PostIndexItem = Backbone.CompositeView.extend({
  tagName: 'li',
  template: JST["media/post_index_item"],


  initialize: function(){
    this.listenTo(this.collection, "sync remove add", this.render);
    this.renderCommentIndex()
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

  renderCommentIndex: function(){
    var subview = new Napagram.View.CommentsIndex({
      collection: this.model.comments();
    })
    this.addSubview('.comments', subview);
  },


});
