AlrightEros.Views.Header = Backbone.View.extend({

  initialize: function (options) {
    this.listenTo(
      AlrightEros.currentUser,
      "signIn signOut",
      this.render
    );
    this.render();
  },

  events: {
    "click #sign-out-link": "signOut"
  },

  template: JST['shared/header'],

  render: funtion () {
    var content = this.template({
      currentUser: AlrightEros.currentUser
    });
    this.$el.html(content)

    return this;
  },

  signOut: function(event) {
    event.preventDefault();
    AlrightEros.currentUser.signOut({
      success: function () {
        Backbone.history.navigate("session/new", {trigger: true})
      }
    });
  }

});
