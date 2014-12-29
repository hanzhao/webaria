#!/usr/bin/env ruby
# File: Create the database for site.
# Author: Magica
# Date: 2014.10.03
##########################################
require 'active_record'
ActiveRecord::Base.establish_connection adapter: 'sqlite3',
                                        database: File.expand_path('../db.sqlite', __FILE__)
ActiveRecord::Schema.define do
  create_table :tasks, force: true do |t|
    t.string    :uri
    t.string    :filename
    t.string    :gid
    t.integer   :status
    t.datetime  :created_at
    t.datetime  :updated_at
  end
end
