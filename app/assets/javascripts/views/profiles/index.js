;(function(){
	"use strict";
  AlrightEros.Views.ProfilesIndex = Backbone.CompositeView.extend({
    initialize: function (options) {
      // this.listenTo(this.collection, "sync change:username", this.render);
      this.listenTo(this.collection, "add", this.addProfileView);
      this.listenTo(this.collection, "remove", this.removePhotoView);
      this.collection.each(this.addProfileView.bind(this));
    },

    template: JST['profiles'],

    className: 'profiles-index',

    render: function () {
      var content = this.template();
      this.$el.html(content);
      this.attachSubviews();

      return this;
    },

    addProfileView: function(profile){
      profile.fetch();
      var subview = new AlrightEros.Views.ProfileSnapshot({model: profile});
      this.addSubview(".profiles-list", subview);
    },

    removeProfileView: function(profile) {
      this.removeModelSubview(".profiles-list", profile);
    }

  })
})();
