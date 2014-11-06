require 'capistrano/git'

module CustomStrategy
    def test
      test! " [ -d #{repo_path}/.git ] "
    end

    def check
      test! :git, :'ls-remote', repo_url
    end

    def clone
      git :clone, '-b', fetch(:branch), '--recursive', repo_url, repo_path
    end

    def update
      git :checkout, '-B', fetch(:branch), "--track origin/#{fetch(:branch)}"
      git :pull
      git :fetch, '--tags'
    end

    def release
      release_branch = fetch(:release_branch, File.basename(release_path))

      if fetch(:tag, '') != ''
        version_to_deploy = "tags/#{fetch(:tag)}"
      else
        version_to_deploy = "origin/#{fetch(:branch)}"
      end

      git :checkout, '-B', release_branch, version_to_deploy
      git :submodule, :update, '--init', '--recursive'
      context.execute "rsync -ar --exclude=.git\* #{repo_path}/ #{release_path}"
    end

    def fetch_revision
      context.capture(:git, :log, '--date=relative --format=format:"%H - %an (%s) - %ai" | head -1')
    end
  end