;(function(){
	"use strict";
	AlrightEros.Collections.Messages = Backbone.Collection.extend({
		model: AlrightEros.Models.Message,

		url: '/api/messages',

		comparator: function (model1, model2) {
			var date1 = new Date(model1.get('timestamp'));
			var date2 = new Date(model2.get('timestamp'));
			if (date1 > date2){
				return -1
			} else {
				return 1
			}
		}
	});
})();


// AlrightEros.Collections.Messages = Backbone.Collection.extend({
//   model: AlrightEros.Models.Message,
//   url: '/api/messages',
//   comparator: function (message) {
//     return -message.get("timestamp")
//   }
// })
