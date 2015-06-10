;(function() {
  'use strict';
  AlrightEros.Views.ProfileSort = Backbone.View.extend({

    initialize: function(options) {
      AlrightEros.motivations = new AlrightEros.Models.MotivationOptions();
			this.listenTo(AlrightEros.motivations, "sync", this.render);
			AlrightEros.motivations.fetch();
    },

    tagName: 'form',

    template: JST['profiles/sort'],

    render: function () {
      var content = this.template({
        motivations: AlrightEros.motivations.motivations
      });

      this.$el.html(content);

      return this;
    }
  });
})();
