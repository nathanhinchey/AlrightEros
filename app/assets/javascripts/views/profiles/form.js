;(function(){
	"use strict";
  AlrightEros.Views.ProfileForm = Backbone.View.extend({

    initialize: function (options) {
      this.listenTo(this.model, "sync", this.render);
			AlrightEros.motivations = new AlrightEros.Models.MotivationOptions();
			this.listenTo(AlrightEros.motivations, "sync", this.render)
			AlrightEros.motivations.fetch();
    },

    events: {
      'submit': 'submit',
      'change #input-profile-picture': 'fileInputChange'
    },

    template: JST['profiles/form'],

    tagName: 'form',

    className: 'profile',

    render: function () {
      var content = this.template({
        profile: this.model,
				motivations: AlrightEros.motivations.motivations
      });
      this.$el.html(content);

      return this;
    },

    submit: function (event) {
      event.preventDefault();

      var $form = $(event.currentTarget);
      var formData = this.$el.serializeJSON().profile;
      var profile = this.model;
      profile.set(formData)


      // FIXME success in a success?????
      profile.save({}, {
        success: function () {
          AlrightEros.profiles.add(profile);
          AlrightEros.currentUser.fetch({
            success: function(){
              Backbone.history.navigate("", {trigger: true});
            }
          })
        },
        error: function(resp){
          console.log('Profile save errors:');
          console.log(resp);
        }
      });
    },

    fileInputChange: function (event) {
      var view = this;
      var file = event.currentTarget.files[0];
      var reader = new FileReader();

      reader.onloadend = function(){
        view._updatePreview(reader.result);
        view.model._picture = reader.result;
      }

      if (file) {
        reader.readAsDataURL(file);
      }
      else {
        view._updatePreview("");
        delete view.model._picture;
      }
    },

    _updatePreview: function(src){
      this.$el.find("#preview-profile-image").attr("src", src)
    }
  });
})();
