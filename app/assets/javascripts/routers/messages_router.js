;(function(){
	"use strict";
	AlrightEros.Routers.Messages = Backbone.Router.extend({
		initialize: function (options) {
			this.$bodyEl = options.$bodyEl;
			this.$headerEl = options.$headerEl;
			AlrightEros.messages = new AlrightEros.Collections.Messages();
			AlrightEros.messages.fetch({data: {recent: true}});
		},

		routes: {
			"messages" : "index"
		},

		index: function(){
			this._swapContentHeaderView();
			AlrightEros.messages.fetch({data: {recent: true}});
			var indexView = new AlrightEros.Views.MessagesIndex({
				collection: AlrightEros.messages,
				inboxView: true
			});
			this._swapContentBodyView(indexView);
		}
	})
})();
