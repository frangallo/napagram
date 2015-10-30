Napagram.Views.Header = Backbone.CompositeView.extend({
  template: JST["header/header"],

  initialize: function(){
  },

  render: function(){
    this.$el.html(this.template());
    return this;
  },

  
});
