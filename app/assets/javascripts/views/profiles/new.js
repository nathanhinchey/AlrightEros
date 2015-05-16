AlrightEros.Views.ProfileNew = Backbone.View.extend({

  initialize: function (options) {
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    'submit form': 'submit'
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

    this.model.set(formData);
    var profile = this.model;

    profile.save({},{
      success: function () {
        console.log('success');
        AlrightEros.profiles.add(profile);
        Backbone.history.navigate("", {trigger: true});
      }
    });
  },
});
