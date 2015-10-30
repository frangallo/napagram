Napagram.Views.PostIndexItem = Backbone.CompositeView.extend({
  tagName: "li",
  template: JST["media/post_index_item"],

  events: {
    "click .heart-image" : 'toggleLike'
  },

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
    this.renderComments();
    this.listenTo(this.model.comments(), "add", this.addCommentView);
    this.listenTo(this.model.like(), "change", this.render);
    this.listenTo(this.model.comments(), "remove", this.removeCommentView);
    this.listenTo(this.model, "change:num_likes", this.render);
  },

  render: function(){
    this.$el.html(this.template({
                                  post: this.model,
                                  author: this.model.author(),
                                  picture: this.model.picture()}));
    this.attachSubviews();
    return this;
  },

  renderComments: function(){
    var comments = this.model.comments();
    var self = this
    comments.each(function(comment){
      self.addCommentView(comment);
    });
  },

  addCommentView: function(comment){

    var subview = new Napagram.Views.CommentIndexItem({
      model: comment
    })
    this.addSubview('.comments', subview);
  },

  removeCommentView: function(comment){
    this.removeModelSubview('.comments', comment);
  },

  toggleLike: function(event){
    this.model.toggleLike()
  }

});
