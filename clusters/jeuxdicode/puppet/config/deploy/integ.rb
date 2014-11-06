set :puppet_env, 'integ'
#set :tag, "#{fetch(:stage)}"

require "../env/#{fetch(:stage)}.rb"