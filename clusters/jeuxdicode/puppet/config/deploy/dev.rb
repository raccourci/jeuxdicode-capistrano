set :puppet_env, 'dev'
#set :tag, "#{fetch(:stage)}"

require "../env/#{fetch(:stage)}.rb"