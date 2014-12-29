@showmsg = (text) ->
  $('#flash-alert').text text
  $('#flash-container').show()
  $('#flash-container').fadeOut 3000
@fetchTasks = ->
  $.get '/api/tasks', (data, status) ->
    $('#tasks').html data
