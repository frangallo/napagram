Napagram.Models.Media = Backbone.Model.extend(
  _.extend({}, LikesDemo.Mixins.Likable, {
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
