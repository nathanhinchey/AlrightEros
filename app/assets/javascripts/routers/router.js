AlrightEros.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.profiles = new AlrightEros.Collections.Profiles();
    this.profiles.fetch();
  },

  routes: {
    "": "profilesIndex"
  },

  profilesIndex: function () {
    var indexView = new AlrightEros.Views.ProfilesIndex ({
      collection: this.profiles
    })

    this._swapViews(indexView)
  },

  _swapViews: function (newView) {
    this._currentView && this._currentView.remove();
    this._view = newView;
    this.$rootEl.html(newView.render().$el);
  }
})
