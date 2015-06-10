;(function() {
  'use strict';
  AlrightEros.Views.ProfileSort = Backbone.View.extend({

    initialize: function(options) {
      AlrightEros.motivations = new AlrightEros.Models.MotivationOptions();
			this.listenTo(AlrightEros.motivations, "sync", this.render);
			AlrightEros.motivations.fetch();
      this.searchOptions = options.searchOptions;
    },

    events: {
      "submit": "search",
    },

    tagName: 'form',

    template: JST['profiles/sort'],

    render: function () {
      var content = this.template({
        motivations: AlrightEros.motivations.motivations
      });

      this.$el.html(content);

      return this;
    },

    search: function(){
      event.preventDefault();
      this.searchOptions["page"] = 1;
      delete this.searchOptions["min_age"];
      delete this.searchOptions["max_age"];
      delete this.searchOptions["motivation_id"];
      $.each(this.$el.serializeArray(), function(i, field) {
          if (field.value){
            this.searchOptions[field.name] = field.value;
          }
      }.bind(this));
      Backbone.history.navigate("");
      Backbone.history.loadUrl("");
    }
  });
})();
