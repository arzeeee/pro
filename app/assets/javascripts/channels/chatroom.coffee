App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    alert "I am connected"

  disconnected: ->
    # Called when the subscription has been terminated by the server
    alert "I am disconnected"

  received: (data) ->
    $('#messages').append @render_message(data.message, data.user)
    
  render_message : (message, user) ->
    if window.user == user
      return '<div class="event">
                    <div class="content">
                      <div class="ui compact right floated message">
                        <a class="author">' + user + '</a>
                        <em>' + message + '</em>
                      </div>
                    </div>
                  </div>'
    else
      return '<div class="event">
                <div class="content">
                  <div class="ui compact message">
                    <a class="author">' + user + '</a>
                    <em>' + message + '</em>
                  </div>
                </div>
              </div>'
  
  
  
$(document).on 'turbolinks:load', (event) ->
  enter_message()
  # prevent_refresh()
  req = $.getJSON '/name'
  req.success (response) ->
    window.user =  response[0].name
  
prevent_refresh = () ->
  $('#new_message').on 'submit', () ->
    App.chatroom.send
      message: "hey"
      user: 'kuy'

enter_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13
      event.preventDefault()
      if event.target.value.length > 0
        $('#new_message').submit()
        event.target.value = ""
        event.preventDefault()
      else 
        event.preventDefault()

