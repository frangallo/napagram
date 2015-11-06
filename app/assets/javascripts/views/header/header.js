Napagram.Views.Header = Backbone.CompositeView.extend({
  template: JST["header/header"],

  initialize: function(){
    this.users = new Napagram.Collections.UsersSearch();
    var usernames = [];
    var self = this;
    this.users.fetch({
      success: function(){
        self.userCount = self.users.models.length
        self.users.each(function(user) {
          usernames.push(user.get("username"));
        });
        $("#srch-bar").autocomplete({
          source: usernames
        });
      }
    });
  },

  events: {
   "click .logout": "endSession",
   "click #search-button" : "search"
 },

  render: function(){
    this.$el.html(this.template());
    return this;
  },


  search: function(event){
    event.preventDefault();
    var username = this.$("#srch-bar").val();
    var user = this.users.where({username: username})[0];
    this.$("#srch-bar").val("");
    if (typeof user === "undefined") {
      this.$('#srch-bar').val("Sorry no user found...")
    } else {
      Backbone.history.navigate('users/' + user.id, { trigger: true });
    }
  },

  endSession: function(event) {
   event.preventDefault();
   $.ajax({
     url: "/session",
     method: "delete",
     success: function(data) {
       window.location = "";
     }
   });
 }

});
