App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').append data.message
    req = $.getJSON '/name'
    req.success (response) ->
      console.log(response[0].name)
      # if data.user == response[0].name
      #   console.log("in")
      #   messages_sel = document.querySelectorAll(".message");
      #   # messages_sel[messages_sel.length -1].classList.add("right");
      #   # messages_sel[messages_sel.length -1].classList.add("floated");
      #   messages_sel[messages_sel.length -1].addClass("right");
      #   messages_sel[messages_sel.length -1].addClass("floated");
        
$(document).on 'turbolinks:load', ->
  enter_message()
  
enter_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13
      if event.target.value.length > 0
        $('#new_message').submit()
        event.target.value = ""
        event.preventDefault()
      else 
        event.preventDefault()

