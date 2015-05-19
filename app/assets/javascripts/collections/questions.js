AlrightEros.Collections.Questions = Backbone.Collection.extend({
  url: "/api/questions",

  model: AlrightEros.Models.Question,

  nextNewQuestion: function (startNum) {
    (startNum += 1) || (startNum = 1);

    var answered_questions = AlrightEros.currentUser.attributes.answered_questions
    for (var modelIdx = startNum; modelIdx < this.models.length; modelIdx++){
      if (_.indexOf(answered_questions, modelIdx) === -1 ){
        return modelIdx;
      }
    }

    if (startNum !== 1) {
      for (var modelIdx = 1; modelIdx < startNum; modelIdx++){
        if (_.indexOf(answered_questions, modelIdx) === -1 ){
          return modelIdx;
        }
      }
    }

    return 'done';
  }
});
