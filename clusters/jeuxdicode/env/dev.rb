set :stage, :dev

server 'jeuxdicode.dev', user: fetch(:ssh_user), roles: %w{web db app cache}