Napagram.Models.Medium = Backbone.Model.extend(
  _.extend({}, Napagram.Mixins.Likable, {
    urlRoot: "api/media",

    likableOptions: {
      foreignKey: "media_id"
    },

    comments: function () {
      if (!this._comments) {
        this._comments = new Napagram.Collections.Comments([], { author: this });
      }

      return this._comments;
    },

    parse: function (response) {
      if (response.comments) {
        this.comments().set(response.comments, { parse: true });
        delete response.comments;
      }

      if (response.like) {
        this.like().set(response.like, { parse: true });
        delete response.like;
      }
    },
  })
);
