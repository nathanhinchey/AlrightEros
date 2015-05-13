window.AlrightEros = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new AlrightEros.Routers.Router({
      $rootEl: $("#main-view");
      Backbone.history.start();
    })
  }
};

$(document).ready(function(){
  AlrightEros.initialize();
});
