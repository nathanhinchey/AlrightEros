AlrightEros.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.profiles = AlrightEros.Collections.Profiles;
    this.profiles.fetch();
  },

  routes: {
    "": "profilesIndex"
  },

  profilesIndex: function () {
    
  }
})
