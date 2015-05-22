;(function(){
	"use strict";
	AlrightEros.Views.MessagesIndex = Backbone.View.extend({
		initialize: function (options) {
			this.listenTo(this.collection, "add", this.render);
			this.otherUserId = options.otherUserId;
		},

		template: JST['messages'],

		render: function () {
			var content = this.template({
				messages: this.collection.sort()
			});
			this.$el.html(content);

			return this;
		},

		events: {
			'keyup form': 'enterKey'
		},

		enterKey: function(event){
			console.log("keyup");
			var code = event.keyCode || event.which;
			if (code === 13){
				console.log("enter up");
				event.preventDefault();

				this.submitForm(event);
			}
		},

		submitForm: function(event){
			var formData = $(event.currentTarget).serializeJSON();
			formData['message']['receiver_id'] = this.otherUserId;
			var message = new AlrightEros.Models.Message(formData.message)
			message.save({},{
				success: function () {
					this.collection.add(message);
				}.bind(this)
			})
		}
	});
})();
