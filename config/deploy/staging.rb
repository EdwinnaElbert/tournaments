# frozen_string_literal: true

server "85.90.246.161",   user: "jowidevwiz", roles: %w(web app db), port: 300

set :branch,              "change_form"
set :deploy_to,           "/data/survey"

set :unicorn_config_path, "#{current_path}/config/unicorn/staging.rb"
set :unicorn_pid,         "#{shared_path}/tmp/pids/unicorn.pid"
set :unicorn_rack_env,    "production"
