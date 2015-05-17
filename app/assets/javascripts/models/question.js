AlrightEros.Models.Question = Backbone.Model.extend({
  url: 'api/questions/',

  createQuestion: function (options) {
    // var model = this;
    // var questionParams = {
    //   "question[email]": options.email,
    //   "user[password]": options.password
    // };

    $.ajax({
      url: this.url,
      type: "POST",
      data: options,
      dataType: "json",
      success: function (responseData) {
        console.log("");
        console.log(responseData);
        // model.set(responseData);
        //the options here are the options passed in to signIn
        // AlrightEros.currentUser.fetch({
        //   success: function() {
        //     console.log("success callback on currentUser.fetch()");
        //     options.success && options.success();
        //   }
        // });
      },
      error: function () {
        //the options here are the options passed in to signIn
        options.error && options.error();
      }
    })
  },
})
