# config valid only for current version of Capistrano
lock '3.10.0'

set :application, 'protospace_in_dev-master'
set :repo_url,  'git@github.com:tsutaya100507/protospace_in_dev-master.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['/Users/tatsuyaichikawa/.ssh/tatsuyaichikawa.pem']
                  # ※例：/Users/yusukeyamane/.ssh/key_pem.pem

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
