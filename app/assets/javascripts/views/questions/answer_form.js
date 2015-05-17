AlrightEros.Views.QuestionAnswerForm = Backbone.View.extend({
  template: JST['questions/answer_form'],

  tagName: 'form',

  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render)
  },

  events: {
    "submit form": "submit"
  },

  render: function() {
    var content = this.template({
      question: this.model
    });
    this.$el.html(content);

    return this;
  },

  submit: function(event){
    event.preventDefault();

    var formData = this.$el.serializeJSON();


  }
});
