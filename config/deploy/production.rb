# frozen_string_literal: true

server 'srv.rookie.works', user: 'deploy', roles: %w[app web db]
set :deploy_to, '/home/deploy/rookie.works'
