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
			this.searchOptions = {
				page: 1
			};
			window.searchOptions = this.searchOptions;
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

			this._indexHeader();
			if (page_string){
				this.searchOptions.page = parseInt(page_string, 10);
			}
			if (!this._requireSignedIn()) {return;}
			if (!this._requireHasProfile()) {return;}

			var indexView = new AlrightEros.Views.ProfilesIndex({
				collection: AlrightEros.profiles,
				searchOptions: this.searchOptions
			});
			this._swapContentBodyView(indexView);
		},

    essayShow: function (id) {
      var profile = this._profileHeader(id);
      var essayView = new AlrightEros.Views.ProfileEssays({
        model: profile
      });

      this._swapContentBodyView(essayView);
    },

    // This says "user" in places that should say "profile";
		// the code points to write place, but should be re-written
		// for improved readability
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
    },

		_indexHeader: function (id) {
      if (!this._requireSignedIn()) { return; }
      if (!this._requireHasProfile()) { return; }

			this._sortView = new AlrightEros.Views.ProfileSort({
				searchOptions: this.searchOptions
			});

			this._swapContentHeaderView(this._sortView);
    },
  });
})();
