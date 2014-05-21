# config valid only for Capistrano 3.1
lock '3.2.1'

# Automatically precompile assets
# load "deploy/assets"
 

set :default_stage, 'production'
set :stages, %w(production staging)
# require 'capistrano/ext/multistage'
# require 'bundler/capistrano'

set :application, "sample_app"
# set :repository
set :repo_url, "git@github.com:stackexpress-tarun/sample-app.git"
set :deploy_to, '/home/vagrant/app'
set :scm, :git
set :branch, 'master'
set :user, 'vagrant'
# set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }
set :deploy_via, :copy
set :keep_releases, 5
set :use_sudo, true
set :rails_env,       "production"
# set :ssh_options, {:forward_agent => true}
role :web, "192.168.33.10"                          # Your HTTP server, Apache/etc
# role :app, "192.168.33.10"                          # This may be the same as your `Web` server
# role :db,  "192.168.10.23", :primary => true
# default_run_options[:shell] = 'bash'

after "deploy:restart", "deploy:cleanup"

# namespace :deploy do

#   desc "symlink shared files"
#   task :symlink_shared, :roles => :app do
#     run "ln -nfs #{shared_path}/system/mongoid.yml #{release_path}/config/mongoid.yml"
#     run "ln -nfs #{shared_path}/system/application.yml #{release_path}/config/application.yml"
#   end

#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end

# end
# before "deploy:assets:precompile", "deploy:symlink_shared"

# Unicorn
# require 'capistrano-unicorn'
# after 'deploy:restart', 'unicorn:reload'    # app IS NOT preloaded
# after 'deploy:restart', 'unicorn:restart'   # app preloaded
