;(function(){
	"use strict";
	AlrightEros.Views.NewMessage = Backbone.View.extend({
		initialize: function (options){
			this.listenTo(this.profile, 'sync', this.render)
		},

		tagName: 'form',

		template: JST['messages/new'],

		render: function () {
			var content = this.template({
				profile: this.model
			});
		}
	})
})();
