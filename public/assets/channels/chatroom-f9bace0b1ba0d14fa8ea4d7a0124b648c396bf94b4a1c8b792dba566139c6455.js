(function() {
  var enter_message, render_message;

  App.chatroom = App.cable.subscriptions.create("ChatroomChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      return $('#messages').append(render_message(data.message, data.user));
    }
  });

  $(document).on('turbolinks:load', function(event) {
    var req;
    enter_message();
    req = $.getJSON('/name');
    return req.success(function(response) {
      return window.user = response[0].name;
    });
  });

  enter_message = function() {
    return $('#message_content').on('keydown', function(event) {
      if (event.keyCode === 13) {
        if (event.target.value.length > 0) {
          $('#new_message').submit();
          event.target.value = "";
          return event.preventDefault();
        } else {
          return event.preventDefault();
        }
      }
    });
  };

  render_message = function(message, user) {
    if (window.user === user) {
      return '<div class="event"> <div class="content"> <div class="ui compact right floated message"> <a class="author">' + user + '</a> <em>' + message + '</em> </div> </div> </div>';
    } else {
      return '<div class="event"> <div class="content"> <div class="ui compact message"> <a class="author">' + user + '</a> <em>' + message + '</em> </div> </div> </div>';
    }
  };

}).call(this);
