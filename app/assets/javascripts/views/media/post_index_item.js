Napagram.Views.PostIndexItem = Backbone.CompositeView.extend({
  tagName: "li",
  template: JST["media/post_index_item"],

  events: {
    "click .heart-image" : 'toggleLike',
    "submit .new-comment-form" : "submitComment"
  },

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
    this.renderComments();
    this.listenTo(Napagram.Collections.pictures, "add", this.render)
    this.listenTo(this.model.picture(), "reset add change:url sync", this.render);
    this.listenTo(this.model.comments(), "add", this.addCommentView);
    this.listenTo(this.model.like(), "change", this.render);
    this.listenTo(this.model.comments(), "remove", this.removeCommentView);
    this.listenTo(this.model, "change:num_likes", this.render);
  },

  render: function(){
    console.log(this.model.escape("id") + ":" + this.model.picture());
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
  },

  submitComment: function(event){
    event.preventDefault();
    var $input = this.$(".comment-text")
    var body = $input.val();
    var newComment = new Napagram.Models.Comment();
    var id = this.model.get("id");
    var self = this;
    newComment.set({body: body, media_id: id})
    newComment.save({}, {
      success: function(){
        self.model.comments().add(newComment, {merge: true})
      }
    })
    $input.val("");
  }

});
