# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"
set :rails_env, "production"
set :application, "survey"
set :repo_url, "ssh://git@git.jowi.club:300/maryna/surveys.git"

set :default_stage, "production"

set :log_level, :info
set :pty, true

set :linked_dirs, %w(log tmp vendor/bundle public/system public/assets)
set :linked_files,        %w{config/database.yml config/master.key}
# set :linked_files,        %w{config/database.yml config/redis.yml .env config/master.key}
set :rvm_ruby_version,    "2.5.1@shopapi"

set :bundle_env_variables, rails_env: "production"

after "deploy:publishing", "deploy:restart"
namespace :deploy do
  task :restart do
    invoke "unicorn:stop"
    invoke "unicorn:start"
  end
end
