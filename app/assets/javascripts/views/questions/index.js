AlrightEros.Views.QuestionsIndex = Backbone.View.extend({
  className: 'questions-index',

  template: JST['questions'],

  initialize: function (options) {
    this.listenTo(this.collection, "add sync", this.render)
  },

  render: function () {
    var content = this.template({questions: this.collection});
    this.$el.html(content);

    return this;
  }
});
