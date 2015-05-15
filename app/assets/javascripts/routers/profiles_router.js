AlrightEros.Routers.Profiles = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    AlrightEros.profiles = new AlrightEros.Collections.Profiles();
  },

  routes: {
    "": "index",
    "profiles/new": "new",
    "profiles/:id": "show"
  },

  index: function () {
    if (!this._requireSignedIn()) { return; }
    if (!this._requireHasProfile()) { return; }

    AlrightEros.profiles.fetch();
    var indexView = new AlrightEros.Views.ProfilesIndex ({
      collection: AlrightEros.profiles
    });

    this._swapViews(indexView);
  },

  show: function (id) {
    if (!this._requireSignedIn()) { return; }
    if (!this._requireHasProfile()) { return; }

    var profile = AlrightEros.profiles.getOrFetch(id);
    var showView = new AlrightEros.Views.ProfileShow ({
      model: profile
    });

    this._swapViews(showView);
  },

  _swapViews: function (newView) {
    this._currentView && this._currentView.remove();
    this._view = newView;
    this.$rootEl.html(newView.render().$el);
  }
})
