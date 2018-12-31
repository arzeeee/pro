(function() {
  var enter_message, render_message;

  App.chatroom = App.cable.subscriptions.create("ChatroomChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      return alert(render_message("aa", "bb"));
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

  render_message = function(message, sender) {
    var req;
    req = $.getJSON('/name');
    alert("success");
    return req.success(function(response) {
      if (sender === response[0].name) {
        alert("again");
        return '<div class="event"> <div class="content"> <div class="ui compact message"> <a class="author">Yano</a> <em>Test</em> </div> </div> </div>';
      }
    });
  };

}).call(this);
