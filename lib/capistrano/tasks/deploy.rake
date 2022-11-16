namespace :deploy do
  task :restart_unicorn do
    on roles(:app) do
      execute "sudo systemctl restart unicorn"
    end
  end

  task :restart_sidekiq do
    on roles(:app) do
      execute "sudo systemctl restart sidekiq"
    end
  end
end
