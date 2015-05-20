AlrightEros.Views.ProfileAnswers = Backbone.View.extend({
  initialize: function (options) {
    this.username = options.username,
    this.listenTo(this.collection, "add", this.render)
  },

  tagName: 'ul',

  template: JST['profiles/answers'],

  render: function () {
    var content = this.template({
      answers: this.collection,
      username: this.username
    });

    this.$el.html(content);

    return this;
  }
});
