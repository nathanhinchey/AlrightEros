;(function(){
	"use strict";
  AlrightEros.Views.SignUp = Backbone.View.extend({

    initialize: function (options) {
      this.callback = options.callback;
    },

    events: {
      'submit form': 'submit',
			'click .demo': 'demo'
    },

    template: JST['shared/sign_up'],

    render: function () {
      this.$el.html(this.template());

      return this;
    },

    submit: function (event) {
      event.preventDefault();

      var $form = $(event.currentTarget);
      var formData = $form.serializeJSON().user;
      formData.success = function () {
        Backbone.history.navigate("", {trigger: true})
      };

      this.model.signUp(formData);
    },

    demo: function (event) {
      event.preventDefault();

      var $form = $(event.currentTarget);
      var formData = $form.serializeJSON().user;

      AlrightEros.currentUser.signIn({
        email: "thecount",
        password: "1234567890",
        success: function () {
					Backbone.history.navigate("", {trigger: true});
				}
      });
    },

    signInCallback: function (event) {
      if (this.callback) {
        this.callback();
      }
      else {
        Backbone.history.navigate("", {trigger: true})
      }
    }
  });
})();
