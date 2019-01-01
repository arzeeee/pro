App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append render_message(data.message, data.user)
        
$(document).on 'turbolinks:load', (event) ->
  App.chatroom.received
  enter_message()
  req = $.getJSON '/name'
  req.success (response) ->
    window.user =  response[0].name
  
enter_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13
      if event.target.value.length > 0
        # form = $('#new_message')[0]
        # Rails.fire(form, 'submit')
        $('#new_message').submit()
        event.target.value = ""
        event.preventDefault()
      else 
        event.preventDefault()
        
render_message = (message, user) ->
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

