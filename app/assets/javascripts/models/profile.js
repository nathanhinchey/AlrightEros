;(function(){
	"use strict";
  AlrightEros.Models.Profile = Backbone.Model.extend({

    toJSON: function() {
      var json = { profile: _.clone( this.attributes ) }

      if (this._picture){
        json.profile.picture = this._picture;
      }

      return json;
    },

    urlRoot: "/api/profiles",
  })
})();
