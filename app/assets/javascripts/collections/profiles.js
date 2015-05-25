;(function(){
	"use strict";
  AlrightEros.Collections.Profiles = Backbone.Collection.extend({
    url: "/api/profiles",

    model: AlrightEros.Models.Profile,

		_page: 1,
  });
})();
