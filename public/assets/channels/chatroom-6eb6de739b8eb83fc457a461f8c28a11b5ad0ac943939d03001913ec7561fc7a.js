(function() {
  var enter_message, render_message, req;

  App.chatroom = App.cable.subscriptions.create("ChatroomChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {}
  }, req = $.getJSON('/name'), req.success(function(response) {
    return $('#messages').append(render_message(data.message, data.user));
  }));

  $(document).on('turbolinks:load', function() {
    return enter_message();
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
    alert("again");
    return '<div class="event"> <div class="content"> <div class="ui compact message"> <a class="author">' + user + '</a> <em>' + message + '</em> </div> </div> </div>';
  };

}).call(this);
