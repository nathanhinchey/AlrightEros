AlrightEros.Views.QuestionNew = Backbone.View.extend({
  initialize: function (options){
    // this.listenTo(this.model, 'sync', this.render)
  },

  tagName: "form",

  template: JST['questions/new'],

  events: {
    'click button': 'submit'
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);

    return this;
  },

  submit: function (event) {
    event.preventDefault();

    questionData = this.$el.serializeJSON();
    var answers = questionData.question.answers;
    debugger;
    !answers[3].answer_text && delete answers[3];
    !answers[4].answer_text && delete answers[4];
    debugger;
    this.model.save(questionData, {
      success: function () {
        console.log("question saved");
      }
    })
  }


});
