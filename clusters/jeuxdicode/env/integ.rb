set :stage, :integ

server 'jeuxdicode.integ', user: fetch(:ssh_user), roles: %w{web db app cache}