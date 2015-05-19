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

    this._swapMainView(signInView);
  },

  signup: function () {
    if (!this._requireSignedOut()) { return; }

    var newUser = new AlrightEros.Models.User();
    var signUpView = new AlrightEros.Views.SignUp({
      model: newUser
    });

    this._swapMainView(signUpView);
  },

  logout: function () {
    if (!this._requireSignedOut()) { return; }

    Backbone.history.navigate("");
    var logOutView = new AlrightEros.Views.LogOut({});

    this._swapMainView(logOutView);
    setTimeout(function () {
      if ($('.logout').html()){
        Backbone.history.loadUrl("")
      }
    }, 5000);
  }
})
