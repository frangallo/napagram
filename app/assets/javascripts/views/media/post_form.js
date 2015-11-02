Napagram.Views.PostForm= Backbone.CompositeView.extend({
  template: JST["media/post_form"],

  events: {

  },

  initialize: function(){

  },

  render: function(){
    this.$el.html(this.template({}));
    this.attachSubviews();
    return this;
  },

});
