AlrightEros.Views.ProfileSnapshot = Backbone.View.extend({
  template: JST['profiles/snapshot'],

  tagName: 'li',

  className: 'profile-snapshot',

  render: function () {
    var content = this.template({
      profile: this.model
    });
    this.$el.html(content);

    return this;
  }
});
