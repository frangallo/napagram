Napagram.Views.UserShow = Backbone.CompositeView.extend({
  template: JST["users/user_show"],

  initialize: function(){
    // this.renderPosts();
    // var posts = this.model.posts();
    this.listenTo(this.model, "sync", this.render);
    // this.listenTo(posts, "add", this.addUserPostIndexItemView);
    // this.listenTo(posts, "remove", this.removeUserPostIndexItemView);
    // this.collection.each(this.addUserPostIndexItemView.bind(this));
  },

  render: function(){
    this.$el.html(this.template({user: this.model}));
    // this.attachSubviews();
    return this;
  },

  // renderPosts: function(){
  //   var self = this;
  //   this.posts.each(function(post){
  //     self.addUserPostIndexItemView(post)
  //   })
  // },
  //
  // addUserPostIndexItemView: function(postIndexItem){
  //   var subview = new Napagram.Views.UserPostIndexItem({
  //     model: postIndexItem
  //   });
  //   this.addSubview('.user-posts', subview);
  // },
  //
  // removeUserPostIndexItemView: function(postIndexItem){
  //   this.removeModelSubview('.user-post', postIndexItem);
  // },

});
