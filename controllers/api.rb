get '/api/tasks' do
  erb :tasks, layout: false, locals: { tasks: Task.all.reverse }
end
