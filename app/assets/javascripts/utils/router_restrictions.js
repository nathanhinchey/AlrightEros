Backbone.Router.prototype.signIn = function(callback){
  if (!this._requireSignedOut(callback)) { return; }

  // var signInView = new AlrightEros.Views.SignIn({
  //   callback: callback
  // });
  // this._swapViews(signInView);
  Backbone.history.navigate("/login", {trigger: true})
},

Backbone.Router.prototype._requireSignedIn = function (callback) {
  if (!AlrightEros.currentUser.isSignedIn()) {
    // console.log("not signed in");
    // callback = callback || this._go.bind(this, "/signup");
    // this.signIn(callback);
    Backbone.history.navigate("/login", {trigger: true})
    return false;
  }
  // console.log("already signed in");

  return true;
};

Backbone.Router.prototype._requireSignedOut = function(callback){
  if (AlrightEros.currentUser.isSignedIn()) {
    // callback = callback || this._go.bind(this, "");
    // callback();
    Backbone.history.navigate("", {trigger: true})
    return false;
  }

  return true;
};

Backbone.Router.prototype._requireHasProfile = function(callback){
  if (AlrightEros.currentUser.escape("has_profile") === "false") {
    callback = callback || this._go.bind(this, "/profiles/new");
    callback();
    return false;
  }

  return true;
};

Backbone.Router.prototype._goHome = function(){
  Backbone.history.navigate("", { trigger: true });
};

Backbone.Router.prototype._go = function(route){
  Backbone.history.navigate(route, { trigger: true });
};

Backbone.Router.prototype._swapViews = function (newView) {
  AlrightEros._currentView && AlrightEros._currentView.remove();
  AlrightEros._currentView = newView;
  this.$rootEl.html(newView.render().$el);
}
