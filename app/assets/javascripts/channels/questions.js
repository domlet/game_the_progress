App.questions = App.cable.subscriptions.create('QuestionsChannel', {
  received: function(data) {
    console.log('received');
    $("#questions").removeClass('hidden');
    $('#questions').html(this.renderQuestion(data));
    $('#answers').html(this.renderAnswers(data));
  },

  renderQuestion: function(data) {
    console.log('question rendered');
    return "<p>" + data.question_text + "</p>";
  },

  renderAnswers: function(data) {
    console.log('answer rendered');
    console.log(data.answer_options[0].text)
    // return ("<button id='0' type='button' formaction='/results' formmethod='post'>" + data.answer_options[0].text + "</button>")
    return ("<p>" + data.answer_options[0].text + "</p>" + "<p>" + data.answer_options[1].text + "</p>" + "<p>" + data.answer_options[2].text + "</p>")

    // data.answer_options.forEach(function(answer_option) {
    //   console.log(answer_option.text);
    //   $('#answers').html(answer_option.text);
      // return "<p>" + answer_option.text + "</p>"
  }

});
