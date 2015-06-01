;(function(){
	"use strict";
  AlrightEros.Collections.Profiles = Backbone.Collection.extend({

    url: "/api/profiles",

    model: AlrightEros.Models.Profile,

		parse: function (response){
			this.last_page = response.last_page;
			return response.profiles;
		}

  });
})();
