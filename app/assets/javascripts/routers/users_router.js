AlrightEros.Routers.Users = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    AlrightEros.profiles = new AlrightEros.Collections.Profiles();
  },

  routes: {
    "signup": "signup",
    "login": "login"
  },

  login: function () {
    if (!this._requireSignedOut()) { return; }

    var signInView = new AlrightEros.Views.SignIn({});

    this._swapViews(signInView);
  },

  signup: function () {
    if (!this._requireSignedOut()) { return; }

    var signInView = new AlrightEros.Views.SignUp({});

    this._swapViews(signInView);
  },

  _swapViews: function (newView) {
    this._currentView && this._currentView.remove();
    this._view = newView;
    this.$rootEl.html(newView.render().$el);
  }
})
