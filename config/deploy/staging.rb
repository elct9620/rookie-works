# frozen_string_literal: true

server '159.65.135.43', user: 'deploy', roles: %w[app web db beta]
set :deploy_to, '/home/deploy/beta.rookie.works'
