;(function(){
	"use strict";
	AlrightEros.Views.MessagesIndex = Backbone.View.extend({
		initialize: function (options) {
			this.listenTo(this.collection, "add", this.render);
		},

		template: JST['messages'],

		render: function () {
			var content = this.template({
				messages: this.collection.sort()
			});
			this.$el.html(content);

			return this;
		},
	});
})();
