Napagram.Mixins.Followable = {
  follow: function () {
    if (!this._follow) {
      this._follow = new Napagram.Models.Relationship;
    }
    return this._follow;
  },

  createFollow: function () {
    this.follow().set(this.followableOptions.foreignKey, this.id);
    this.follow().save({}, {
      success: function () {
        this.updateFollowCount(1);
      }.bind(this)
    });
  },

  destroyFollow: function () {
    this.follow().destroy({
      success: function (model) {
        model.unset("id");
        this.updateLikeCount(-1);
      }.bind(this)
    });
  },

  toggleFollow: function () {
    if (this.follow().isNew()) {
      this.createFollow();
    } else {
      this.destroyFollow();
    }
  },

  updateFollowCount: function (num) {
    this.set("followers_count", this.get("followers_count") + num);
  },

  parseFollow: function (payload) {
    // Call this inside the model's #parse method.
    if (payload.follow) {
      this.follow().set(payload.follow);
      delete payload.follow;
    }
  }
}
