AlrightEros.Collections.Profiles = Backbone.Collection.extend({
  url: "/api/profiles",

  model: AlrightEros.Models.Profile,

  getOrFetch: function (id) {
    var profile = this.get(id);
    var collection = this;
    if (profile){
      console.log("found it");
      profile.fetch();
    }
    else {
      profile = new AlrightEros.Models.Profile({
        id: id
      });
      profile.fetch({
        success: function () {
          collection.add(profile);
        }
      })
    }

    return profile;
  }
})
