;(function(){
	"use strict";
  AlrightEros.Routers.Questions = Backbone.Router.extend({
    initialize: function (options) {
      this.$bodyEl = options.$bodyEl;
      this.$headerEl = options.$headerEl;
      AlrightEros.profiles = new AlrightEros.Collections.Profiles();
      AlrightEros.questions = new AlrightEros.Collections.Questions();
    },

    routes: {
      "questions": "index",
      "questions/new": "new",
      "questions/done": "answered_all",
      "questions/:id": "answer"
    },

    new: function () {
      if (!this._requireSignedIn()) { return; }

      var question = new AlrightEros.Models.Question();

      var newView = new AlrightEros.Views.QuestionNew ({
        model: question
      });

      this._swapContentBodyView(newView);

    },

    answer: function(id) {
      var question = new AlrightEros.Models.Question({id: id})
      question.fetch();
      var answerView = new AlrightEros.Views.QuestionAnswerForm({
        model: question
      })

      this._swapContentBodyView(answerView)
    },

    index: function () {
      var questions = new AlrightEros.Collections.Questions();
      questions.fetch();
      var indexView = new AlrightEros.Views.QuestionsIndex({
        collection: questions
      });
      this._swapContentBodyView(indexView)
    },

    answered_all: function () {
      var allAnsweredView = new AlrightEros.Views.AnsweredAll();

      this._swapContentBodyView(allAnsweredView)
    }
  })
})();
