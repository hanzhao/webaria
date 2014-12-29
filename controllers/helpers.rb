helpers do
  def h(text)
    Rack::Utils.escape_html text
  end
  def u(uri)
    Rack::Utils.escape uri
  end
end

