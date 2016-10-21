# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'eliteshopping'
set :repo_url, 'git@github.com:SumatoSoft/eliteshopping.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/assets', 'public/spree'

# for the best compression
task :compress_assets do
  on roles(:app) do
    assets_path = release_path.join('public', 'assets')
    execute "find -L #{assets_path} \\( -name *.js -o -name *.css -o -name *.ico -o -name *.svg -o -name *.pdf \\) -exec bash -c \"[ ! -f '{}.gz' ] && zopfli --gzip --i20 '{}'\" \\; "
  end
end

task :compress_png do
  on roles(:app) do
    assets_path = release_path.join('public', 'assets')
    execute "find -L #{assets_path} \\( -name *.png \\) -not \\( -name 'zopflied_*.png' \\) -exec bash -c 'FULLPATH='{}'; FILENAME=${FULLPATH##*/}; BASEDIRECTORY=${FULLPATH%$FILENAME}; [ ! -f \"${BASEDIRECTORY}zopflied_${FILENAME}\" ] && zopflipng \"${FULLPATH}\" \"${BASEDIRECTORY}zopflied_${FILENAME}\" ' \\; "
  end
end

desc "Check for untracked or uncommitted files"
task :git_status do
  puts '======================== GIT STATUS ============================='
  sh 'git status -s'
  puts '================================================================='
end

before 'deploy:starting', 'git_status'
after 'deploy:normalize_assets', 'compress_assets'
after 'deploy:normalize_assets', 'compress_png'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
