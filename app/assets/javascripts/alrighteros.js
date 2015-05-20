window.AlrightEros = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(currentUserId) {
      //instantiate the currentUser singleton
    this.currentUser = new AlrightEros.Models.CurrentUser({id: currentUserId});
    this.currentUser.fetch();

    new AlrightEros.Views.Header({
      el: "#top-header"
    });

    var mainEls = {
      $bodyEl: $("#content-body"),
      $headerEl: $("#content-header")
    }

    new AlrightEros.Routers.Profiles(mainEls);
    new AlrightEros.Routers.Users(mainEls);
    new AlrightEros.Routers.Questions(mainEls);

    Backbone.history.start();
  }
};
