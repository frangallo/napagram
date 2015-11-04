Napagram.Views.UserPostIndexItem = Backbone.View.extend({
  template: JST["users/user_post_index_item"],

  events: {
    "mouseenter img" : "showStats",
    "mouseleave img" : "removeStats"
  },

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
  },

  render: function(){
    this.$el.html(this.template({post: this.model,
                                 total_comments: this.model.comments().length,
                                 picture: this.model.picture()}));
    return this;
  },

  showStats: function(event){
    event.preventDefault();
    this.$el.find(".image-detail").css("display", "block");
  },

  removeStats: function(event){
    event.preventDefault();
    this.$el.find(".image-detail").css("display", "none");
  },

});
