# Config
configure do
  set :public_folder, File.expand_path('./public', SINATRA_ROOT)
  # set :static_cache_control, [:public, :max_age => 600]
end

# Database
require 'active_record'
ActiveRecord::Base.establish_connection adapter: 'sqlite3',
                                        database: File.expand_path('./db/db.sqlite',  SINATRA_ROOT)
ActiveRecord::Base.default_timezone = :local

# Models
Dir[File.expand_path('./models/*.rb', SINATRA_ROOT)].uniq.each do |model|
  require model
end

# Controllers
Dir[File.expand_path('./controllers/*.rb', SINATRA_ROOT)].uniq.each do |controller|
  require controller
end
