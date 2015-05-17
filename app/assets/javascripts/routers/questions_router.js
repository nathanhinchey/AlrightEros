AlrightEros.Routers.Questions = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    AlrightEros.profiles = new AlrightEros.Collections.Profiles();
  },

  routes: {
    "questions/new": "new"
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

  }
})
