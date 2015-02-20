# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'ccalculo'
set :repo_url, 'https://github.com/RaulKite/ccalculo.git'

set :linked_files, %w{config/database.yml config/initializers/devise.rb config/secrets.yml}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :sudo, '/etc/init.d/ccalculo restart'
    end
  end

  desc 'Stop application'
  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      execute :sudo, '/etc/init.d/ccalculo stop'
    end
  end

  desc 'Start application'
  task :start do
    on roles(:app), in: :sequence, wait: 5 do
      execute :sudo, '/etc/init.d/ccalculo start'
    end
  end

  desc "Check that we can access everything"
  task :check_write_permissions do
    on roles(:all) do |host|
      if test("[ -w #{fetch(:deploy_to)} ]")
        info "#{fetch(:deploy_to)} is writable on #{host}"
      else
        error "#{fetch(:deploy_to)} is not writable on #{host}"
      end
    end
  end

  after :finishing, 'deploy:cleanup'
  after 'deploy', 'deploy:restart'


end
