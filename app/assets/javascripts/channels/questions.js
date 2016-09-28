// Creates a thing that is listening to this channel:
App.questions = App.cable.subscriptions.create('QuestionsChannel', {
  // 'data' is anything broadcast by the server (see 'questions_controller')
  received: function(data) {
    console.log('received');
    // The controller has sent these objects (the NEXT stuff), so now we can work with them:
    $("#questions").removeClass('hidden'); // Unknown
    $('#questions').html(this.renderQuestion(data)); // Renders the new question
    $('#a').html(data.answer_options[0].text);
    $('#b').html(data.answer_options[1].text);
    $('#c').html(data.answer_options[2].text);
    $('#d').html(data.answer_options[3].text); // Renders the new answers
    // Hide and show 'Next' button
    $('.next-button').css("display", "none");
    $("#button-" + (data.question_id + 1)).css("display", "inline");
    // Hide and show 'Results' buttons
    $('.results-buttons').css("display", "none");
    $("#results-" + (data.question_id)).css("display", "inline");
    $("#progress-bar").html("<progress value='" + data.question_id + "' max='10'></progress>");
    // $("#progress-bar").html(data.question_id);

  },

  renderQuestion: function(data) {
    console.log('question rendered');
    return "<p>" + data.question_id + ". " + data.question_text + "</p>";


  }

  // renderAnswers: function(data) {
  //   console.log('answer rendered');
  //   return ("<p>A. " + data.answer_options[0].text + "</p>" +
  //           "<p>B. " + data.answer_options[1].text + "</p>" +
  //           "<p>C. " + data.answer_options[2].text + "</p>" +
  //           "<p>D. " + data.answer_options[3].text + "</p>")

  // }



});

