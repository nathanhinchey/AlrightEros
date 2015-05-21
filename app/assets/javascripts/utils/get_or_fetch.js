;(function(){
	"use strict";
  Backbone.Collection.prototype.getOrFetch = function (id) {
    var model = this.get(id);
    var collection = this;
    if (model){
      model.fetch();
    }
    else {
      model = new this.model({
        id: id
      });
      model.fetch({
        success: function () {
          collection.add(model);
        }
      })
    }

    return model;
  }
})();
