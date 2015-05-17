AlrightEros.Models.Question = Backbone.Model.extend({
  urlRoot: 'api/questions/',

  createQuestion: function (options) {
    // var model = this;
    // var questionParams = {
    //   "question[email]": options.email,
    //   "user[password]": options.password
    // };

    $.ajax({
      url: this.url(),
      type: "POST",
      data: options,
      dataType: "json",
      success: function (responseData) {
        options.success && options.success();
      },
      error: function () {
        //the options here are the options passed in to signIn
        options.error && options.error();
      }
    })
  },

})
