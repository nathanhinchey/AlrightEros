;(function(){
	"use strict";
  AlrightEros.Views.LogOut = Backbone.View.extend({
    template: JST['shared/logout'],

    render: function () {
      var content = this.template();
      this.$el.html(content);

      return this;
    }
  })
})();
