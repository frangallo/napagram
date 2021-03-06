Napagram.Views.UserShow = Backbone.CompositeView.extend({
  template: JST["users/user_show"],

  events: {
    "click .following-btn" : 'toggleFollow',
  },

  initialize: function(){
    var posts = this.model.posts();
    this.renderPosts(posts);
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(posts, "add", this.addUserPostIndexItemView);
    this.listenTo(posts, "remove", this.removeUserPostIndexItemView);
    this.listenTo(this.model, "change:followers_count", this.render);
  },

  render: function(){
    this.$el.html(this.template({user: this.model,
                                 picture: this.model.picture()
                               }));
    this.attachSubviews();
    return this;
  },

  toggleFollow: function(event){
    this.model.toggleFollow()
    Napagram.Collections.feed.fetch()
  },

  renderPosts: function(posts){
    var self = this;
    posts.each(function(post){
      self.addUserPostIndexItemView(post)
    });
  },

  addUserPostIndexItemView: function(postIndexItem){
    var subview = new Napagram.Views.UserPostIndexItem({
      model: postIndexItem
    });
    this.addSubview('.user-posts', subview);
  },

  removeUserPostIndexItemView: function(postIndexItem){
    this.removeModelSubview('.user-post', postIndexItem);
  },

});
