;(function(){
	"use strict";
  AlrightEros.Views.ProfilesIndex = Backbone.CompositeView.extend({
    initialize: function (options) {
      // this.listenTo(this.collection, "sync change:username", this.render);
      this.listenTo(this.collection, "add", this.addProfileView);
      this.listenTo(this.collection, "remove", this.removeProfileView);
			this.listenTo(this.collection, "sync", this.render);
			this.searchOptions = options.searchOptions;
			this.collection.fetch({
				data: this.searchOptions
			});
			this.collection.each(this.addProfileView.bind(this));
    },

		events: {
			'click .next': 'next',
			'click .previous': 'previous'
		},

    template: JST['profiles'],

    className: 'profiles-index',

    render: function () {
      var content = this.template({
				moreAfter: this.searchOptions.page <= this.collection.last_page,
				moreBefore: this.searchOptions.page > 1
			});
      this.$el.html(content);
      this.attachSubviews();
      return this;
    },

    addProfileView: function(profile){
      var subview = new AlrightEros.Views.ProfileSnapshot({model: profile});
      this.addSubview(".profiles-list", subview);
    },

    removeProfileView: function(profile) {
      this.removeModelSubview(".profiles-list", profile);
    },

		next: function (event) {
			this.changePage(event, 1);
		},

		previous: function (event) {
			this.changePage(event, -1);
		},

		changePage: function(event, direction) {
			event.preventDefault();
			this.searchOptions.page += direction;
			Backbone.history.navigate(
				"profileindex/" + (this.searchOptions.page),
				{trigger: false}
			)

			this.collection.fetch({
				data: this.searchOptions
			})
		}

  })
})();
