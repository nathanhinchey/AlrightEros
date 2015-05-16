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

    // header stuff
  },

  new: function () {
    console.log("entered Profiles#new");
    if (!this._requireSignedIn()) { return; }
    console.log("still in Profiles#new");


    var profile = new AlrightEros.Models.Profile();

    var newView = new AlrightEros.Views.ProfileNew ({
      model: profile
    });

    this._swapViews(newView);

  }
})
