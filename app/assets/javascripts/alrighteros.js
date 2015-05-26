;(function(){
	"use strict";
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
			new AlrightEros.Routers.Messages(mainEls);

      Backbone.history.start();
    },

		markImagesWideOrTall: function () {
			console.log("marking images");
			var $images = $("img");
			$.each($images, function(index, image){
				console.log("in each function");
				var img = new Image();
				img.src = $(image).attr("src");

				if (img.width > img.height){
					$(image).addClass("wide");
				} else {
					$(image).addClass("tall");
				}
			});
		}
  };
})();
