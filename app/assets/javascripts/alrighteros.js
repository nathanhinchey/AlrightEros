window.AlrightEros = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(currentUserId) {
      //instantiate the currentUser singleton
    this.currentUser = new AlrightEros.Models.CurrentUser({id: currentUserId});
    this.currentUser.fetch();

    new AlrightEros.Routers.Profiles({
      $rootEl: $("#main-view")
    })

    this.header = new AlrightEros.Views.Header({
      el: "#top-header"
    });
    this.router = new AlrightEros.Routers.Profiles({
      $rootEl: $("#main-view")
    });
    this.router = new AlrightEros.Routers.Users({
      $rootEl: $("#main-view")
    });
    this.router = new AlrightEros.Routers.Questions({
      $rootEl: $("#main-view")
    });

    Backbone.history.start();
  }
};
