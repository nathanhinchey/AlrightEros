AlrightEros.Routers.Profiles = Backbone.Router.extend({
  initialize: function (options) {
    this.$bodyEl = options.$bodyEl;
    this.$headerEl = options.$headerEl;
    AlrightEros.profiles = new AlrightEros.Collections.Profiles();
    AlrightEros.currentUser.fetch();
  },

  routes: {
    "": "index",
    "profiles/new": "new",
    "profiles/edit": "edit",
    "profiles/:id": "essayShow",
    "profiles/:id": "essayShow",
    "profiles/:id": "questionShow",
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

  questionShow: function (id) {
    var profile = this._profileHeader(id);
    var answers = new AlrightEros.Collections.UserAnswers({
      userId: id
    });

    answers.fetch();
    var answerView = new AlrightEros.Views.ProfileAnswers({
      collection: answers,
      model: profile
    })

    this._swapContentBodyView(answerView);
  },

  //TODO make essay view

  essayShow: function (id) {
    var profile = this._profileHeader(id);
    var answers = new AlrightEros.Collections.UserAnswers({
      userId: id
    });

    answers.fetch();
    var essayView = new AlrightEros.Views.ProfileEssays({
      model: profile
    })

    this._swapContentBodyView(answerView);
  },

  edit: function () {
    if (!this._requireSignedIn()) { return; }
    if (!this._requireHasProfile()) { return; }
    var view = this;

    AlrightEros.currentUser.fetch({
      success: function () {
        var id = AlrightEros.currentUser.get('profile_id');
        var profile = AlrightEros.profiles.getOrFetch(id);

        var editView = new AlrightEros.Views.ProfileForm ({
          model: profile
        });

        view._swapContentBodyView(editView);
      }
    });
  },

  new: function () {
    if (!this._requireSignedIn()) { return; }


    var profile = new AlrightEros.Models.Profile();

    var newView = new AlrightEros.Views.ProfileForm ({
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
