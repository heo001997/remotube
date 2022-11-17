app_dir = "/home/heo001997/deploy/remotube/current"
working_directory app_dir
log_dir = "#{app_dir}/log"
tmp_dir = "#{app_dir}/tmp"

# Set unicorn options
worker_processes 4
preload_app true
timeout 30

# Set up socket location
listen "#{tmp_dir}/sockets/unicorn.sock", :backlog => 64

# Logging
stderr_path "#{log_dir}/unicorn.stderr.log"
stdout_path "#{log_dir}/unicorn.stdout.log"

# Set master PID location
pid "#{tmp_dir}/pids/unicorn.pid"

before_exec do |_|
  ENV["BUNDLE_GEMFILE"] = File.join(app_path, "Gemfile")
end

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{tmp_dir}/pids/unicorn.pid.oldbin"

  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
