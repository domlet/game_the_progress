App.questions = App.cable.subscriptions.create('QuestionsChannel', {
  received: function(data) {
    console.log('received');
    $("#questions").removeClass('hidden')
    return $('#questions').html(this.renderResult(data));
  },

  renderResult: function(data) {
    console.log('question rendered');
    return "<p> <b>" + data.answer_options + " </b>" + data.question_text + "</p>";
  }
});
