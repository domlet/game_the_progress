// Creates a thing that is listening to this channel:
App.questions = App.cable.subscriptions.create('ClassResultsChannel', {
  // 'data' is anything broadcast by the server (see 'questions_controller')
  received: function(data) {
    $('#percent-a').html(Math.round(data.percent_a) + "%");
    $('#percent-b').html(Math.round(data.percent_b) + "%");
    $('#percent-c').html(Math.round(data.percent_c) + "%");
    $('#percent-d').html(Math.round(data.percent_d) + "%");
  }

});