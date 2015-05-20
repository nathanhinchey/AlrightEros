AlrightEros.Collections.UserAnswers = Backbone.Collection.extend({
  initialize: function (options) {
    this.userId = options.userId;
  },

  url: function () {
    return "/api/users/" + this.userId + "/user_answers"
  },

  model: AlrightEros.Models.UserAnswer,

});


//Making a collection to look at the API.
//Then it can be used to show the questions index
//for a particular user.
