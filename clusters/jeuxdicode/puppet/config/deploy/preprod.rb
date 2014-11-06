set :puppet_env, 'preprod'
#set :tag, "#{fetch(:stage)}"

require "../env/#{fetch(:stage)}.rb"