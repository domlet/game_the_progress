// Creates a thing that is listening to this channel:
App.results = App.cable.subscriptions.create('ResultsChannel', {
  received: function(data) {
    console.log('received');
    $("#results").removeClass('hidden')
    console.log(data)
    return $('#results').append(this.renderResult(data));
  },

  renderResult: function(data) {
    console.log('result rendered');
    return "<span> <b>" + data.user + ": </b>" + data.answer + "</span>";
  }
});
