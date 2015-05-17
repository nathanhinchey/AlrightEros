AlrightEros.Models.Profile = Backbone.Model.extend({
  urlRoot: "/api/profiles",

  submit: function (event) {
    event.preventDefault();

    var $form = $(event.currentTarget);
    var formData = $form.serializeJSON().user;
    formData.success = function () {
      Backbone.history.navigate("", {trigger: true})
    };

    this.model.signUp(formData);
  },

  signInCallback: function (event) {
    if (this.callback) {
      this.callback();
    }
    else {
      Backbone.history.navigate("", {trigger: true})
    }
  }
})
