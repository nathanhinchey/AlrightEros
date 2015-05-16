AlrightEros.Routers.Users = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    AlrightEros.profiles = new AlrightEros.Collections.Profiles();
    this.listenTo(AlrightEros.currentUser, 'signOut', this.logout)
  },

  routes: {
    "signup": "signup",
    "login": "login",
    "logout": "logout"
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

  logout: function () {
    if (!this._requireSignedOut()) { return; }

    Backbone.history.navigate("");
    var logOutView = new AlrightEros.Views.LogOut({});

    this._swapViews(logOutView);
  }
})
