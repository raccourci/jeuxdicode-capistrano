set :branch, 'release'
#set :tag, "#{fetch(:stage)}"

require "../../env/#{fetch(:stage)}.rb"