;(function(){
	"use strict";
  AlrightEros.Views.QuestionsIndex = Backbone.View.extend({
    className: 'questions-index',

    template: JST['questions'],

    initialize: function (options) {
      this.listenTo(this.collection, "add sync", this.render);
			this.collection.page = 1;
			this.collection.fetch({
				data: {page: this.collection.page}
			})
    },

		events: {
			'click .next': 'next',
			'click .previous': 'previous'
		},

    render: function () {
      var content = this.template({questions: this.collection});
      this.$el.html(content);

      return this;
    },

		next: function (event) {
			event.preventDefault();
			this.collection.page++;
			this.collection.fetch({
				data: {page: this.collection.page}
			});
		},

		previous: function (event) {
			event.preventDefault();
			this.collection.page--;
			this.collection.fetch({
				data: {page: this.collection.page}
			});
		},

  });
})();
