set :stage, :prod

server 'jeuxdicode_f1.prod', user: fetch(:ssh_user), roles: %w{web}
server 'jeuxdicode_f2.prod', user: fetch(:ssh_user), roles: %w{web app}
server 'jeuxdicode_db1.prod', user: fetch(:ssh_user), roles: %w{db}
server 'jeuxdicode_v1.prod', user: fetch(:ssh_user), roles: %w{cache}
