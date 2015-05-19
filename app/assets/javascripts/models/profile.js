AlrightEros.Models.Profile = Backbone.Model.extend({

  toJSON: function() {
    var json = { profile: _.clone( this.attributes ) }

    if (this._picture){
      json.profile.picture = this._picture;
    }

    return json;
  },

  urlRoot: "/api/profiles",


  //
  // submit: function (event) {
  //   event.preventDefault();
  //
  //   var $form = $(event.currentTarget);
  //   var formData = $form.serializeJSON().user;
  //   formData.success = function () {
  //     Backbone.history.navigate("", {trigger: true})
  //   };
  //
  //   this.model.signUp(formData);
  // },
  //
  // signInCallback: function (event) {
  //   if (this.callback) {
  //     this.callback();
  //   }
  //   else {
  //     Backbone.history.navigate("", {trigger: true})
  //   }
  // }
})
