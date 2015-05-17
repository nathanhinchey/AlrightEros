AlrightEros.Models.Answer = Backbone.Model.extend({

  initialize: function (options) {
    this.question_id = options.question_id
  },

  url: function(){
    var _url = "/api/users/" + AlrightEros.currentUser.id + "/answers"
  },

  createUserAnswer: function (options) {

    $.ajax({
      url: this.url,
      type: "POST",
      data: options,
      dataType: "json",
      success: function (responseData) {
        console.log("");
        console.log(responseData);
      },
      error: function () {
        //the options here are the options passed in to signIn
        options.error && options.error();
      }
    })
  },
});
