AlrightEros.Views.ProfilesIndex = Backbone.View.extend({
  initialize: function (options) {
    this.listenTo(this.collection, "sync add change:username", this.render)
  },

  template: JST['profiles'],

  render: function () {
    var content = this.template({profiles: this.collection})
    this.$el.html(content);

    return this;
  }

})
