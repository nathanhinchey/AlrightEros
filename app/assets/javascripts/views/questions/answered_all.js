AlrightEros.Views.AnsweredAll = Backbone.View.extend({
  template: JST['questions/answered_all'],

  tagName: "form",

  className: "all-answered",

  render: function () {
    this.$el.html(this.template());

    return this;
  }
})
