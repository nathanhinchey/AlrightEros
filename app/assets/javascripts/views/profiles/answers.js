;(function(){
	"use strict";
  AlrightEros.Views.ProfileAnswers = Backbone.View.extend({
    initialize: function (options) {
      this.listenTo(this.model, "sync", this.render)
      this.listenTo(this.collection, "sync", this.render)
    },

    tagName: 'ul',

    template: JST['profiles/answers'],

		events: {
			"click .answer-button": "answerModal"
		},

    render: function () {
      var content = this.template({
        answers: this.collection,
        username: this.model.escape("username")
      });

      this.$el.html(content);

      return this;
    },

		answerModal: function (event) {
			event.preventDefault();
			var id = parseInt($(event.currentTarget).data('question-id'), 10);
      var question = new AlrightEros.Models.Question({id: id})
      question.fetch();
      var answerView = new AlrightEros.Views.QuestionAnswerForm({
        model: question,
				modal: true,
				parentView: this,
      });
			$("#modal-view").removeClass("hidden");
			$("#modal-pop-up").html(answerView.render().$el);
		}
  });
})();
