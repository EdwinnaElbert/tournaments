# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join("node_modules")
Rails.application.config.assets.precompile += %w( login6.js )
Rails.application.config.assets.precompile += %w( scripts.bundle.js )
Rails.application.config.assets.precompile += %w( vendors.bundle.js )

Rails.application.config.assets.precompile += %w( vendors.bundle.css )
Rails.application.config.assets.paths << Rails.root.join("fonts")
Rails.application.config.assets.paths << Rails.root.join("fonts/flaticon/")
Rails.application.config.assets.paths << Rails.root.join("fonts/fontawesome5/")
Rails.application.config.assets.paths << Rails.root.join("fonts/line-awesome/")
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
