;(function(){
	"use strict";
	AlrightEros.Routers.Messages = Backbone.Router.extend({
		initialize: function (options) {
			this.$bodyEl = options.$bodyEl;
			this.$headerEl = options.$headerEl;
			AlrightEros.messages = new AlrightEros.Collections.Messages();
			AlrightEros.messages.fetch();
		},

		routes: {
			"messages" : "index"
		},

		index: function(){
			this._swapContentHeaderView();
			AlrightEros.messages.fetch();
			var indexView = new AlrightEros.Views.MessagesIndex({
				collection: AlrightEros.messages
			});
			this._swapContentBodyView(indexView);

		}
	})
})();
