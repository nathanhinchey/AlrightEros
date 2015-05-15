Backbone.Router.prototype.signIn = function(callback){
  if (!this._requireSignedOut(callback)) { return; }

  var signInView = new AlrightEros.Views.SignIn({
    callback: callback
  });
  this._swapViews(signInView);
},

Backbone.Router.prototype._requireSignedIn = function (callback) {
  if (!AlrightEros.currentUser.isSignedIn()) {
    console.log("not signed in");
    callback = callback || this._goHome;//.bind(this);
    this.signIn(callback);
    return false;
  }
  console.log("already signed in");

  return true;
};

Backbone.Router.prototype._requireSignedOut = function(callback){
  if (AlrightEros.currentUser.isSignedIn()) {
    callback = callback || this._goHome.bind(this);
    callback();
    return false;
  }

  return true;
};

Backbone.Router.prototype._goHome = function(){
  console.log("_goHome");
  Backbone.history.navigate("#/sessions/new", { trigger: true });
};
