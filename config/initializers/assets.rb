# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.paths << Rails.root.join('vendor', 'gaia', 'sass')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'gaia', 'js')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'gaia', 'img')

# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile << /\.(jpg|png)\z/
Rails.application.config.assets.precompile += %w[ ckeditor/config.js ]
