Napagram.Models.Medium = Backbone.Model.extend(
  _.extend({}, Napagram.Mixins.Likable, {
    urlRoot: "api/media",

    likableOptions: {
      foreignKey: "media_id"
    },

    comments: function () {
      if (!this._comments) {
        this._comments = new Napagram.Collections.Comments([], { post: this });
      }

      return this._comments;
    },

    author: function () {
      if (!this._author) {
        this._author = new Napagram.Models.User([], { post: this });
      }

      return this._author;
    },

    parse: function (response) {
      if (response.comments) {
        this.comments().set(response.comments, { parse: true });
        delete response.comments;
      }

      if (response.author) {
        this.author().set(response.author, { parse: true });
        delete response.author;
      }

      if (response.like) {
        this.like().set(response.like);
        delete response.like;
      }
      return response
    }
  })
);
