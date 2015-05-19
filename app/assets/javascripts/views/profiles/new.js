AlrightEros.Views.ProfileNew = Backbone.View.extend({

  initialize: function (options) {
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    'submit form': 'submit',
    'change #input-profile-picture': 'fileInputChange'
  },

  template: JST['profiles/new'],

  render: function () {
    this.$el.html(this.template());

    return this;
  },

  submit: function (event) {
    event.preventDefault();

    var $form = $(event.currentTarget);
    var formData = $form.serializeJSON().profile;
    var profile = this.model;

    profile.save(formData,{
      success: function () {
        console.log('Profile saved');
        AlrightEros.profiles.add(profile);
        AlrightEros.currentUser.fetch({
          success: function(){
            Backbone.history.navigate("", {trigger: true});
          }
        })
      },
      errors: function(resp){
        console.log('Profile save errors:');
        console.log(resp);
      }
    });
  },

  fileInputChange: function (event) {
    console.log("entering fileInputChange");
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
