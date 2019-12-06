# frozen_string_literal: true

server 'srv.rookie.works', user: 'deploy', roles: %w[app web db beta]
set :deploy_to, '/home/deploy/beta.rookie.works'
