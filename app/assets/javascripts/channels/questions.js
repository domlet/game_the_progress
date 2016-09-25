// Creates a thing that is listening to this channel:
App.questions = App.cable.subscriptions.create('QuestionsChannel', {
  // 'data' is anything broadcast by the server (see 'questions_controller')
  received: function(data) {
    console.log('received');
    // The controller has sent these objects (the NEXT stuff), so now we can work with them:
    $("#questions").removeClass('hidden'); // Unknown
    $('#questions').html(this.renderQuestion(data)); // Renders the new question
    $('#answers').html(this.renderAnswers(data)); // Renders the new answers
    $('#answer-buttons-a').html(data.answer_options[0].id); // Gives the new answerId to the result form partial
    $('#answer-buttons-b').html(data.answer_options[1].id); // Gives the new answerId to the result form partial
    $('#answer-buttons-c').html(data.answer_options[2].id); // Gives the new answerId to the result form partial
    // $('#answer-buttons-d').html(data.answer_options[3].id); // Gives the new answerId to the result form partial
    // Now, to render the new buttons correctly populated with the route and new ids
    console.log(data.answer_options[0].id)
    console.log(data.answer_options[1].id)
    console.log(data.answer_options[2].id)
  },

  renderQuestion: function(data) {
    console.log('question rendered');
    return "<p>" + data.question_text + "</p>";
  },

  renderAnswers: function(data) {
    console.log('answer rendered');
    console.log(data.answer_options[0].text)
    // return ("<button id='0' type='button' formaction='/results' formmethod='post'>" + data.answer_options[0].text + "</button>")
    return ("<p><button onclick='myFunction()'>Trigger js</button> " + data.answer_options[0].text + "</p>" +
            "<p><button onclick='myFunction()'>Trigger js</button> " + data.answer_options[1].text + "</p>" +
            "<p><button onclick='myFunction()'>Trigger js</button> " + data.answer_options[2].text + "</p>")

    // data.answer_options.forEach(function(answer_option) {
    //   console.log(answer_option.text);
    //   $('#answers').html(answer_option.text);
      // return "<p>" + answer_option.text + "</p>"
  }

});
