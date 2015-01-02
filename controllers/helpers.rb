helpers do
  def h(text)
    Rack::Utils.escape_html text
  end
  def u(uri)
    Rack::Utils.escape uri
  end
  def shorten(s)
    s.size > 50 ? s[0..46] + '...' : s
  end
end

