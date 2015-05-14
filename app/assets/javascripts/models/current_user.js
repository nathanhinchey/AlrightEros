AlrightEros.Models.CurrentUser = Backbone.Model.extend({
  url: '/api/session',

  initialize: function (options) {
    this.listenTo(this, "change", this.fireSessionEvent);
  },

  isSignedIn: function (options) {
    return !this.isNew();
  },

  signIn: function (options) {
    var model = this;
    var credentials - {
      "user[email]": options.email,
      "user[password]": options.pasword
    };

    $.ajax({
      url: this.url,
      type: "POST",
      data: credentials,
      dataType: "json",
      success: function (responseData) {
        model.set(responseData);
        //the options here are the options passed in to signIn
        options.success && options.success();
      },
      error: function () {
        //the options here are the options passed in to signIn
        options.error && options.error();
      }
    })
  },

  signOut: function (options) {
    var model = this;

    $.ajax({
      url: this.url,
      type: "DELETE",
      dataType: "json",
      success: function (data) {
        model.clear();
        options.sucess && options.success();
      }
    })
  },

  fireSessionEvent: function () {
    if(this.isSignedIn()){
      this.trigger("signIn");
    }
    else {
      this.trigger("signOut");
    }
  }
})
