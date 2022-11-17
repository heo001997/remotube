namespace :deploy do
  task :restart_unicorn do
    on roles(:app) do
      execute "sudo systemctl stop unicorn"
      sleep 3
      execute "sudo systemctl start unicorn"
    end
  end

  task :restart_sidekiq do
    on roles(:app) do
      execute "sudo systemctl restart sidekiq"
    end
  end
end
