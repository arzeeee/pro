(function() {
  var enter_message, prevent_refresh;

  App.chatroom = App.cable.subscriptions.create("ChatroomChannel", {
    connected: function() {
      return alert("I am connected");
    },
    disconnected: function() {
      return alert("I am disconnected");
    },
    received: function(data) {
      return $('#messages').append(this.render_message(data.message, data.user));
    },
    render_message: function(message, user) {
      if (window.user === user) {
        return '<div class="event"> <div class="content"> <div class="ui compact right floated message"> <a class="author">' + user + '</a> <em>' + message + '</em> </div> </div> </div>';
      } else {
        return '<div class="event"> <div class="content"> <div class="ui compact message"> <a class="author">' + user + '</a> <em>' + message + '</em> </div> </div> </div>';
      }
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

  prevent_refresh = function() {
    return $('#new_message').on('submit', function() {
      return App.chatroom.send({
        message: "hey",
        user: 'kuy'
      });
    });
  };

  enter_message = function() {
    return $('#message_content').on('keydown', function(event) {
      if (event.keyCode === 13) {
        event.preventDefault();
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
