;(function(){
	"use strict";
	AlrightEros.Collections.Messages = Backbone.Collection.extend({
		model: AlrightEros.Models.Message,

		url: '/api/messages',

		comparator: function (model) {
			return model.timestamp;
		}
	});
})();
