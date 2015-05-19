AlrightEros.Collections.Questions = Backbone.Collection.extend({
  url: "/api/questions",

  model: AlrightEros.Models.Question,

  nextNewQuestion: function (startNum) {
    (startNum += 1) || (startNum = 0);

    var answered_questions = AlrightEros.currentUser.attributes.answered_questions
    for (var modelIdx = startNum; modelIdx < this.models.length; modelIdx++){
      var question_id = this.models[modelIdx].id;
      if (_.indexOf(answered_questions, question_id) === -1 ){
        return question_id;
      }
    }

    if (startNum !== 0) {
      for (var modelIdx = 0; modelIdx < startNum; modelIdx++){
        var question_id = this.models[modelIdx].id;
        if (_.indexOf(answered_questions, question_id) === -1 ){
          return question_id;
        }
      }
    }

    return 'done';
  },

  idToIndex: function (ID) {
    
  }
});
