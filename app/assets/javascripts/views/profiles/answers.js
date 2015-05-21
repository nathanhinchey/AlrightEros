;(function(){
	"use strict";
  AlrightEros.Views.ProfileAnswers = Backbone.View.extend({
    initialize: function (options) {
      this.listenTo(this.model, "sync", this.render)
      this.listenTo(this.collection, "add", this.render)
    },

    tagName: 'ul',

    template: JST['profiles/answers'],

    render: function () {
      var content = this.template({
        answers: this.collection,
        username: this.model.escape("username")
      });

      this.$el.html(content);

      return this;
    }
  });
})();
