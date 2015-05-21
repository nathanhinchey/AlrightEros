;(function(){
	"use strict";
  AlrightEros.Models.Question = Backbone.Model.extend({
    urlRoot: 'api/questions/',

    comparator: function () {
      return this.created_at;
    }

  })
})();
