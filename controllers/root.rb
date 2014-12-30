#!/usr/bin/env ruby

get '/' do
  erb :index
end

post '/' do
  uri = params['link']
  unless uri.start_with?('http://') || uri.start_with?('ftp://') || uri.start_with?('magnet:')
    uri = "http://#{uri}"
  end
  filename = "#{Time.now.to_i}_#{File.basename(uri)}"
  status = -1
  gid ||= nil
  msg ||= nil
  begin
    gid = ARIA2.download(uri, "#{SINATRA_ROOT}/public/downloads/#{filename}")
    status = 0
    msg = 'Task has been added successfully.'
    Task.create(uri:      uri,
                filename: filename,
                gid:      gid,
                status:   status)
  rescue
    status = -1
    msg = 'Invalid resource url.'
  end
  erb :index, locals: { msg: msg }
end
