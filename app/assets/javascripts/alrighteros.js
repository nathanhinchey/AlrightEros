window.AlrightEros = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new AlrightEros.Routers.Profiles({
      $rootEl: $("#main-view")
    })
      this.currentUser = new AlrightEros.Models.CurrentUser();
      this.currentUser.fetch();

      this.header = new AlrightEros.Views.Header({
        el: "#top-header"
      });
      this.router = new AlrightEros.Routers.Profiles({
        $rootEl: $("#main-view")
      });

      Backbone.history.start();
  }
};

$(document).ready(function(){
  AlrightEros.initialize();
});
