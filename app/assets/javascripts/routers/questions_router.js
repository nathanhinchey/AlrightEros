AlrightEros.Routers.Questions = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    AlrightEros.profiles = new AlrightEros.Collections.Profiles();
  },

  routes: {
    "questions": "index",
    "questions/new": "new",
    "questions/:id": "answer"
  },

  new: function () {
    console.log("top of Questions#new (router)");
    // if (!this._requireSignedIn()) { return; }
    // console.log("Questions#new (router) after requireSignedIn");

    var question = new AlrightEros.Models.Question();

    var newView = new AlrightEros.Views.QuestionNew ({
      model: question
    });

    this._swapViews(newView);

  },

  answer: function(id) {
    var question = new AlrightEros.Models.Question({id: id})
    question.fetch();
    var answerView = new AlrightEros.Views.QuestionAnswerForm({
      model: question
    })

    this._swapViews(answerView)
  },

  index: function () {
    var questions = new AlrightEros.Collections.Questions();
    console.log("Routers.Questions#index");
    questions.fetch();
    var indexView = new AlrightEros.Views.QuestionsIndex({
      collection: questions
    });
    this._swapViews(indexView)
  }
})
