AlrightEros.Collections.Questions = Backbone.Collection.extend({
  url: "/api/questions",

  model: AlrightEros.Models.Question,

  nextNewQuestion: function (startNum) {
    (startNum += 1) || (startNum = 0);

    var answered_questions = AlrightEros.currentUser.attributes.answered_questions
    for (var modelIdx = startNum; modelIdx < this.models.length; modelIdx++){
      if (_.indexOf(answered_questions, modelIdx) === -1 ){
        return this.models[modelIdx].id;
      }
    }

    if (startNum !== 0) {
      for (var modelIdx = 0; modelIdx < startNum; modelIdx++){
        if (_.indexOf(answered_questions, modelIdx) === -1 ){
          return this.models[modelIdx].id;
        }
      }
    }

    return 'done';
  }
});
