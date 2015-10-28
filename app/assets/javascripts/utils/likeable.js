Napagram.Mixins.Likable = {
  like: function () {
    if (!this._like) {
      this._like = new Napagram.Models.Like;
    }
    return this._like;
  },

  createLike: function () {
    this.like().set(this.likableOptions.foreignKey, this.id);
    this.like().save({}, {
      success: function () {
        this.updateLikeCount(1);
      }.bind(this)
    });
  },

  destroyLike: function () {
    this.like().destroy({
      success: function (model) {
        model.unset("id");
        this.updateLikeCount(-1);
      }.bind(this)
    });
  },

  toggleLike: function () {
    if (this.like().isNew()) {
      this.createLike();
    } else {
      this.destroyLike();
    }
  },

  updateLikeCount: function (num) {
    this.set("num_likes", this.get("num_likes") + num);
  },

  parseLike: function (payload) {
    // Call this inside the model's #parse method.
    if (payload.like) {
      this.like().set(payload.like);
      delete payload.like;
    }
  }
}
