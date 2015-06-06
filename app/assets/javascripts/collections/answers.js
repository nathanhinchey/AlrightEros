;(function(){
	"use strict";
  AlrightEros.Collections.UserAnswers = Backbone.Collection.extend({
    initialize: function (models, options) {
      this.profileId = options.profileId;
    },

    url: function () {
      return "/api/profiles/" + this.profileId + "/user_answers"
    },

    model: AlrightEros.Models.UserAnswer,

  });
})();

//Making a collection to look at the API.
//Then it can be used to show the questions index
//for a particular user.
