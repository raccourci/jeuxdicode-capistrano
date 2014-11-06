# config valid only for Capistrano 3.2.1
lock '3.2.1'

set :application, 'puppet'

set :scm, :git
set :deploy_via, :remote_cache
set :git_strategy, CustomStrategy

set :ssh_user, 'admin'
set :deploy_to, '/home/admin/puppet'
set :repo_url, 'https://github.com/Raccourci/jeuxdicode-puppet.git'
set :branch, ENV['BRANCH'] || 'master'

set :format, :pretty
set :log_level, :debug
set :keep_releases, 3

after 'deploy:published', :notify do
    invoke 'puppet:apply'
end