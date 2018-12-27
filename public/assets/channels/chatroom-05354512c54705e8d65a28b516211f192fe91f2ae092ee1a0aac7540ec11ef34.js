(function() {
  var enter_message;

  App.chatroom = App.cable.subscriptions.create("ChatroomChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      var req;
      $('#messages').append(data.message);
      req = $.getJSON('/name');
      return req.success(function(response) {
        return console.log(response[0].name);
      });
    }
  });

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

}).call(this);
