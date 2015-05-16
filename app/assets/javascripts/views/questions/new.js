AlrightEros.Views.QuestionNew = Backbone.View.extend({
  initialize: function (options){
    this.listenTo(this.model, 'sync', this.render)
  },

  tagName: "form",

  template: JST['questions/new'],

  events: {
    'click submit': 'submit'
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);

    return this;
  },

  submit: function (event) {
    event.preventDefault();
  }
});
