set :puppet_env, 'prod'
#set :tag, "#{fetch(:stage)}"

require "../env/#{fetch(:stage)}.rb"