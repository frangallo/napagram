Napagram.Mixins.Followable = {
  following_: function () {
    if (!this._following_) {
      this._following_ = new Napagram.Models.Relationship;
    }
    return this._following_;
  },

  createFollow: function () {
    this.following_().set(this.followableOptions.foreignKey, this.id);
    this.following_().save({}, {
      success: function () {
        this.updateFollowCount(1);
      }.bind(this)
    });
  },

  destroyFollow: function () {
    this.following_().destroy({
      success: function (model) {
        model.unset("id");
        this.updateFollowCount(-1);
      }.bind(this)
    });
  },

  toggleFollow: function () {
    if (this.following_().isNew()) {
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
