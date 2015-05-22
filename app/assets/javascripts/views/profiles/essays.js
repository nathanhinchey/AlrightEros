;(function(){
	"use strict";
	AlrightEros.Views.ProfileEssays = Backbone.View.extend({
		initialize: function (options) {
			this.listenTo(this.model, "sync", this.render)
		},

		template: JST['profiles/essays'],

		tagName: 'article',

		className: 'essays',

		render: function () {
			var content = this.template({
				profile: this.model
			});
			this.$el.html(content);

			return this;
		}
	});
})();
