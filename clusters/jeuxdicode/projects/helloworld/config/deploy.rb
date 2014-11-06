# config valid only for Capistrano 3.2.1
lock '3.2.1'

set :application, 'helloworld'

set :scm, :git
set :deploy_via, :remote_cache
set :git_strategy, CustomStrategy

set :ssh_user, 'admin'
set :deploy_to, '/home/admin/www/helloworld'
set :repo_url, 'https://github.com/Raccourci/jeuxdicode-helloworld.git'

set :format, :pretty
set :log_level, :debug
set :keep_releases, 3

set :linked_dirs, %w{app/logs}
set :linked_files, %w{settings.php}

before 'deploy:publishing', :notify do
    invoke 'perms:wwwdata'
    invoke 'maintenance:enable'
end

after 'deploy:published', 'maintenance:disable' do
    invoke 'php:apc_clear'
end