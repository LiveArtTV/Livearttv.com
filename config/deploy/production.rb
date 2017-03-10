server '52.32.189.154', user: 'app', roles: %w{app db web}
set :branch, ENV['BRANCH'] || 'master'
set :deploy_to, '/var/www/apps/eliteshopping_production'
