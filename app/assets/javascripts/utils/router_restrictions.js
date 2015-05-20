Backbone.Router.protoype = _.extend(Backbone.Router.prototype, {
  signIn: function(callback){
    if (!this._requireSignedOut(callback)) { return; }

    // var signInView = new AlrightEros.Views.SignIn({
    //   callback: callback
    // });
    // this._swapMainView(signInView);
    Backbone.history.navigate("/login", {trigger: true})
  },

  _requireSignedIn: function (callback) {
    if (!AlrightEros.currentUser.isSignedIn()) {
      Backbone.history.navigate("/signup", {trigger: true})
      return false;
    }

    return true;
  },

  _requireSignedOut: function(callback){
    if (AlrightEros.currentUser.isSignedIn()) {
      // callback = callback || this._go.bind(this, "");
      // callback();
      Backbone.history.navigate("", {trigger: true})
      return false;
    }

    return true;
  },

  _requireHasProfile: function(callback){
    if (AlrightEros.currentUser.escape("has_profile") === "false") {
      callback = callback || this._go.bind(this, "/profiles/new");
      callback();
      return false;
    }

    return true;
  },

  _goHome: function(){
    Backbone.history.navigate("", { trigger: true });
  },

  _go: function(route){
    Backbone.history.navigate(route, { trigger: true });
  },

  _swapMainView: function (newView) {
    AlrightEros._currentView && AlrightEros._currentView.remove();
    AlrightEros._currentView = newView;
    this.$bodyEl.html(newView.render().$el);
  }

})
