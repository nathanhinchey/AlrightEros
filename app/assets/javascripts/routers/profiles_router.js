;(function(){
	"use strict";
  AlrightEros.Routers.Profiles = Backbone.Router.extend({
    initialize: function (options) {
      this.$bodyEl = options.$bodyEl;
      this.$headerEl = options.$headerEl;
      AlrightEros.profiles = new AlrightEros.Collections.Profiles();
      AlrightEros.currentUser.fetch();
			AlrightEros.messages = new AlrightEros.Collections.Messages();
			AlrightEros.messages.fetch();
    },

    routes: {
      "": "index",
      "profiles/new": "new",
      "profiles/edit": "edit",
      "profiles/:id": "essayShow",
      "profiles/:id/essays": "essayShow",
      "profiles/:id/questions": "questionShow",
			"profiles/:id/messages": "messagesShow",
			"profileindex/:page": "index",

    },

		index: function (page_string) {
			var page = parseInt(page_string, 10);
			this._swapContentHeaderView();
			if (!this._requireSignedIn()) {return;}
			if (!this._requireHasProfile()) {return;}

			var indexView = new AlrightEros.Views.ProfilesIndex({
				collection: AlrightEros.profiles,
				page: page
			});

			this._swapContentBodyView(indexView);
		},

    // This says "user" in places that should say "profile"
		messagesShow: function(id){
      var profile = this._profileHeader(id);
			window.AlrightEros.allMessages;
			var messageArray;

			AlrightEros.messages.fetch({
				success: function (){
					messageArray = AlrightEros.messages.where({
						other_user: Number(id)
					});
					window.AlrightEros.allMessages.set(messageArray);
				}
			});

			window.AlrightEros.allMessages = new AlrightEros.Collections.Messages();

			var conversationView = new AlrightEros.Views.MessagesIndex({
				collection: window.AlrightEros.allMessages,
				otherUserId: id
			})

			this._swapContentBodyView(conversationView);

		},

    questionShow: function (id) {
      var profile = this._profileHeader(id);
      var answers = new AlrightEros.Collections.UserAnswers([], {
        profileId: id
      });

      answers.fetch();
      var answerView = new AlrightEros.Views.ProfileAnswers({
        collection: answers,
        model: profile
      });

      this._swapContentBodyView(answerView);
    },

    //TODO make essay view

    essayShow: function (id) {
      var profile = this._profileHeader(id);

      var essayView = new AlrightEros.Views.ProfileEssays({
        model: profile
      });

      this._swapContentBodyView(essayView);
    },

    edit: function () {
      if (!this._requireSignedIn()) { return; }
      if (!this._requireHasProfile()) { return; }
      var view = this;

      AlrightEros.currentUser.fetch({
        success: function () {
          var id = AlrightEros.currentUser.get('profile_id');
          var profile = AlrightEros.profiles.getOrFetch(id);

          var editView = new AlrightEros.Views.ProfileForm ({
            model: profile
          });

          view._swapContentBodyView(editView);
        }
      });
    },

    new: function () {
      if (!this._requireSignedIn()) { return; }


      var profile = new AlrightEros.Models.Profile();

      var newView = new AlrightEros.Views.ProfileForm ({
        model: profile
      });

      this._swapContentBodyView(newView);

    },

    _profileHeader: function (id) {
      if (!this._requireSignedIn()) { return; }
      if (!this._requireHasProfile()) { return; }

      var profile = AlrightEros.profiles.getOrFetch(id);
      var showView = new AlrightEros.Views.ProfileShow ({
        model: profile
      });

      this._swapContentHeaderView(showView);

      return profile;
    }
  });
})();
