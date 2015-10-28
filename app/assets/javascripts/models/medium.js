Napagram.Models.Medium = Backbone.Model.extend(
  _.extend({}, Napagram.Mixins.Likable, {
    urlRoot: "api/media",

    likableOptions: {
      foreignKey: "media_id"
    },

    parse: function (payload) {
      this.parseLike(payload);
      return payload;
    }
  })
);
