AlrightEros.Routers.Profiles = Backbone.Router.extend({
  initialize: function (options) {
    this.$bodyEl = options.$bodyEl;
    this.$headerEl = options.$headerEl;
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

    this._swapContentBodyView(indexView);
  },

  show: function (id) {
    var profile = this._profileHeader(id);
    var answers = new AlrightEros.Collections.UserAnswers({
      userId: id
    });

    answers.fetch();
    debugger;
    var answerView = new AlrightEros.Views.ProfileAnswers({
      collection: answers,
      model: profile
    })

    this._swapContentBodyView(answerView);
  },

  new: function () {
    if (!this._requireSignedIn()) { return; }


    var profile = new AlrightEros.Models.Profile();

    var newView = new AlrightEros.Views.ProfileNew ({
      model: profile
    });

    this._swapContentBodyView(newView);

  },

  _profileHeader: function (id) {
    if (!this._requireSignedIn()) { return; }
    if (!this._requireHasProfile()) { return; }

    var profile = AlrightEros.profiles.getOrFetch(id);
    var showView = new AlrightEros.Views.ProfileShow ({
      model: profile
    });

    this._swapContentHeaderView(showView);

    return profile;
  }
})
