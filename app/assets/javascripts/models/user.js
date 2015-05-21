;(function(){
	"use strict";
  AlrightEros.Models.User = Backbone.Model.extend({
    url: '/api/users',

    signUp: function (options) {
      var model = this;
      var userParams = {
        "user[email]": options.email,
        "user[password]": options.password
      };

      $.ajax({
        url: this.url,
        type: "POST",
        data: userParams,
        dataType: "json",
        success: function (responseData) {
          model.set(responseData);
          //the options here are the options passed in to signIn
          AlrightEros.currentUser.fetch({
            success: function() {
              options.success && options.success();
            }
          });
        },
        error: function () {
          //the options here are the options passed in to signIn
          options.error && options.error();
        }
      })
    },
  })
})();
