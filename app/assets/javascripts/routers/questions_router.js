AlrightEros.Routers.Profiles = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    AlrightEros.profiles = new AlrightEros.Collections.Profiles();
  },

  routes: {
    "questions/new": "new"
  },

  new: function () {
    if (!this._requireSignedIn()) { return; }

    var question = new AlrightEros.Models.Question();

    var newView = new AlrightEros.Views.QuestionNew ({
      model: question
    });

    this._swapViews(newView);

  }
})
