Napagram.Models.User = Backbone.Model.extend(
  _.extend({}, Napagram.Mixins.Followable, {
    urlRoot: "api/users",

    followableOptions: {
      foreignKey: "followee_id"
    },

    comments: function () {
      if (!this._comments) {
        this._comments = new Napagram.Collections.Comments([], { author: this });
      }

      return this._comments;
    },

    posts: function (){
      if (!this._posts) {
        this._posts = new Napagram.Collections.Posts([], { user: this });
      }

      return this._posts;
    },

    //could be an issue
    picture: function (){
      if (!this._picture) {
        this._picture = new Napagram.Models.Pictures([], { user: this });
      }

      return this._picture;
    },

    followers: function () {
      if (!this._followers) {
        this._followers = new Napagram.Collections.Users([], { user: this });
      }

      return this._followers;
    },

    following: function () {
      if (!this._following) {
        this._following = new Napagram.Collections.Users([], { user: this });
      }

      return this._following;
    },

    parse: function (response) {
      if (response.comments) {
        this.comments().set(response.comments, { parse: true });
        delete response.comments;
      }
      if (response.posts) {
        this.posts().set(response.posts, { parse: true });
        delete response.posts;
      }
      if (response.followers) {
        this.followers().set(response.followers, { parse: true });
        delete response.followers;
      }
      if (response.following) {
        this.following().set(response.following, { parse: true });
        delete response.following;
      }
      if (response.follow) {
        this.follow().set(response.follow, { parse: true });
        delete response.follow;
      }

      return response;
    }
  })
);
