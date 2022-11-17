# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, "remotube"
set :repo_url, "git@github.com:heo001997/remotube.git"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/heo001997/deploy/#{fetch(:application)}"

# Default value for :linked_files is []
append :linked_files

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage", "config/credentials"

# Default value for keep_releases is 5
set :keep_releases, 3


# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
