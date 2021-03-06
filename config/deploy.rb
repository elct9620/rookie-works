# frozen_string_literal: true

require 'English'

# config valid for current version and patch releases of Capistrano
lock '~> 3.12.1'

Dotenv.load

set :application, 'rookie-works'
set :repo_url, 'git@git.frost.tw:elct9620/rookie-works.git'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/secrets.yml', 'config/elastic_apm.yml'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'node_modules', 'public/shared', 'public/uploads'

# Default value for default_env is {}
set :default_env, path: '/usr/local/ruby-2.5.3/bin:$PATH'

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# Rollbar
set :rollbar_token, ENV['ROLLBAR_ACCESS_TOKEN']
set(:rollbar_env, proc { fetch :stage })
set(:rollbar_role, proc { :app })

namespace :deploy do
  desc 'Uploads a robots.txt that mandates the site as off-limits to crawlers'
  task :block_robots do
    content = [
      '# This is a staging site. Do not index.',
      'User-agent: *',
      'Disallow: /'
    ].join($RS)

    on roles(:beta) do
      within release_path do
        info 'Uploading blocking robots.txt'
        execute :echo, "\"#{content}\" > public/robots.txt"
      end
    end
  end

  after :finishing, :block_robots
end
