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
			"messages" : "index",
			"messages/:username" : "show"
		},

		index: function(){
			this._swapContentHeaderView();
			AlrightEros.messages.fetch();
			var indexView = new AlrightEros.Views.MessagesIndex({
				collection: AlrightEros.messages
			});
			this._swapContentBodyView(indexView);
		},

		show: function(username){
			debugger
			this._swapContentHeaderView();
			window.messages;
			var messageArray;

			AlrightEros.messages.fetch({
				success: function (){
					messageArray = AlrightEros.messages.where({
						other_user: username
					});
					window.messages.set(messageArray);
				}
			})

			window.messages = new AlrightEros.Collections.Messages();

			var conversationView = new AlrightEros.Views.MessagesIndex({
				collection: window.messages
			})

			this._swapContentBodyView(conversationView);


		},
	})
})();
