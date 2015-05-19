AlrightEros.Models.UserAnswer = Backbone.Model.extend({

  initialize: function (options) {
    this.question_id = options.question_id
  },

  url: function(){
    return "/api/users/" + AlrightEros.currentUser.id + "/user_answers"
  },

  submitUserAnswer: function (options) {

    $.ajax({
      url: this.url(),
      type: "POST",
      data: options,
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
