(function() {
  'use strict';
  AlrightEros.Models.MotivationOptions = Backbone.Model.extend({
    url: 'api/profiles/new',

    parse: function (response, options) {
      this.motivations = response.motivations;
    }
  });
}());
