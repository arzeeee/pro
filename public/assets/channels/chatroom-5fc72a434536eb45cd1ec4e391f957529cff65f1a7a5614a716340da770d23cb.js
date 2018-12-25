(function() {
  var submit_message;

  App.chatroom = App.cable.subscriptions.create("ChatroomChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      return $('#messages').append(data);
    }
  });

  $(document).on('turbolinks:load', function() {
    return submit_message();
  });

  submit_message = function() {
    return $('#message_content').on('keydown', function(event) {
      if (event.keyCode === 13) {
        $('#send_message').click();
        event.target.value = "";
        return event.preventDefault();
      }
    });
  };

}).call(this);
