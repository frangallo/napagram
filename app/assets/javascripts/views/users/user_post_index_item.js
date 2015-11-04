Napagram.Views.UserPostIndexItem = Backbone.View.extend({
  template: JST["users/user_post_index_item"],

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
  },

  render: function(){
    this.$el.html(this.template({post: this.model,
                                 total_comments: this.model.comments().length,
                                 picture: this.model.picture()}));
    return this;
  },


});
