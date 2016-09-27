// Creates a thing that is listening to this channel:
App.questions = App.cable.subscriptions.create('QuestionsChannel', {
  // 'data' is anything broadcast by the server (see 'questions_controller')
  received: function(data) {
    console.log('received');
    // The controller has sent these objects (the NEXT stuff), so now we can work with them:
    $("#questions").removeClass('hidden'); // Unknown
    $('#questions').html(this.renderQuestion(data)); // Renders the new question
    $('#answers').html(this.renderAnswers(data)); // Renders the new answers
    $('.next-button').hide();
    $("#button-" + (data.question_id + 1)).show();
  },

  renderQuestion: function(data) {
    console.log('question rendered');
    return "<p>" + data.question_text + "</p>";
  },

  renderAnswers: function(data) {
    console.log('answer rendered');
    return ("<p>" + data.answer_options[0].text + "</p>" +
            "<p>" + data.answer_options[1].text + "</p>" +
            "<p>" + data.answer_options[2].text + "</p>" +
            "<p>" + data.answer_options[3].text + "</p>")
  }

});

