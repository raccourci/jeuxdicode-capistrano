set :stage, :preprod

server 'jeuxdicode.preprod', user: fetch(:ssh_user), roles: %w{web db app cache}