# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
  Bullet.enable = false
  Bullet.rails_logger = false
end
