;(function(){
	"use strict";
  AlrightEros.Routers.Questions = Backbone.Router.extend({
    initialize: function (options) {
      this.$bodyEl = options.$bodyEl;
      this.$headerEl = options.$headerEl;
      AlrightEros.profiles = new AlrightEros.Collections.Profiles();
      AlrightEros.questions = new AlrightEros.Collections.Questions();
			AlrightEros.questions.fetch();
    },

    routes: {
      "questions": "index",
      "questions/new": "new",
      "questions/done": "answered_all",
      "questions/:id": "answer"
    },

    new: function () {
			this._swapContentHeaderView();
      if (!this._requireSignedIn()) { return; }

      var question = new AlrightEros.Models.Question();

      var newView = new AlrightEros.Views.QuestionNew ({
        model: question
      });

      this._swapContentBodyView(newView);

    },

    answer: function(id) {
			this._swapContentHeaderView();
      var question = new AlrightEros.Models.Question({id: id})
      question.fetch();
      var answerView = new AlrightEros.Views.QuestionAnswerForm({
        model: question
      })

      this._swapContentBodyView(answerView)
    },

    index: function () {
			this._swapContentHeaderView();


			var next = AlrightEros.questions.nextNewQuestion(1);
			Backbone.history.navigate("#/questions/" + next, {trigger: true});
			//
      // var questions = new AlrightEros.Collections.Questions();
      // questions.fetch();
      // var indexView = new AlrightEros.Views.QuestionsIndex({
      //   collection: questions
      // });
      // this._swapContentBodyView(indexView)
    },

    answered_all: function () {
			this._swapContentHeaderView();
      var allAnsweredView = new AlrightEros.Views.AnsweredAll();

      this._swapContentBodyView(allAnsweredView)
    }
  })
})();
