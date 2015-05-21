;(function(){
	"use strict";
  AlrightEros.Views.ProfileShow = Backbone.CompositeView.extend({
    initialize: function (options) {
      this.listenTo(this.model, "sync", this.render);

    },

    template: JST['profiles/show'],

    render: function () {
      var content = this.template({profile: this.model})
      this.$el.html(content);

      return this;
    }

  })
})();
