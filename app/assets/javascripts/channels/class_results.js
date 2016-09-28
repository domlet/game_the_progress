// Creates a thing that is listening to this channel:
App.questions = App.cable.subscriptions.create('ClassResultsChannel', {
  // 'data' is anything broadcast by the server (see 'questions_controller')
  received: function(data) {
    $('#percent-a').html(data.percent_a);
    $('#percent-b').html(data.percent_b);
    $('#percent-c').html(data.percent_c);
    $('#percent-d').html(data.percent_d);
  }

});