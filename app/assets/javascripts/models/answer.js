;(function(){
	"use strict";
  AlrightEros.Models.UserAnswer = Backbone.Model.extend({

    initialize: function (options) {
      this.question_id = options.question_id
    },

    url: function (){
			debugger
      return this.postUrl() + "/" + this.attributes.id;
    },

    postUrl: function(){
      return "/api/users/" + AlrightEros.currentUser.id + "/user_answers"
    },

    submitUserAnswer: function (data, options) {

      $.ajax({
        url: this.postUrl(),
        type: "POST",
        data: data,
        dataType: "json",
        success: function (responseData) {
          //the options here are the options passed in to createUserAnswer
          // console.log("Models.UserAnswer#submitUserAnswer: SUCCESS");
          options.success && options.success();
        },
        error: function () {
          //the options here are the options passed in to createUserAnswer
          // console.log("Models.UserAnswer#submitUserAnswer: ERROR");
          options.error && options.error();
        }
      })
    },
  });
})();
