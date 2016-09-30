// Creates a thing that is listening to this channel:
App.results = App.cable.subscriptions.create('ResultsChannel', {
  received: function(data) {
    console.log('received');
    $("#results").removeClass('hidden')
    console.log(data)

    if(data.answer % 4 == 1) {
      $(".answer-button-a input").css("background-color", "black").css("color", "white");
    } else if(data.answer % 4 == 2) {
      $(".answer-button-b input").css("background-color", "black").css("color", "white");
    } else if(data.answer % 4 == 3) {
      $(".answer-button-c input").css("background-color", "black").css("color", "white");
    } else if(data.answer % 4 == 0) {
      $(".answer-button-d input").css("background-color", "black").css("color", "white");
    }

    return $('#results').append(this.renderResult(data));
    // return $('.notice').append(this.renderNotice(data)); // muted
  },

  renderResult: function(data) {
    console.log('result rendered');
    return "<span> <b>" + data.user + " answered: </b>" + data.answer + " for Question " + data.question + "</span><br/>";
  },

  // TODO: ajax this
  renderNotice: function(data) {
    console.log('notice rendered');
    return "<span>" + data.notice + "</span>";
  },

  renderStudentResults: function(data) {

  }



});
