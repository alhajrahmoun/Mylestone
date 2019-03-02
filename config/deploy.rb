# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "mylestone"
set :repo_url, "git@github.com:mhdrahmoun/Mylestone.git"

set :deploy_to, '/home/mylestone/apps/mylestone'
append :linked_files, "config/master.key"
set :keep_releases, 2

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
