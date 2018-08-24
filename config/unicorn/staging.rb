# frozen_string_literal: true

app_path =        "/data/survey"
pid               "#{app_path}/shared/tmp/pids/unicorn.pid"

# listen
listen            "#{app_path}/shared/unicorn.socket", backlog: 64

# logging
stderr_path       "log/unicorn.stderr.log"
stdout_path       "log/unicorn.stdout.log"

# workers
worker_processes 2
timeout 60


before_exec do |_|
  ENV["BUNDLE_GEMFILE"] = "#{app_path}/current/Gemfile"
end

# preload
preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!
end

# After forking, restore your ActiveRecord connection.
after_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection
end