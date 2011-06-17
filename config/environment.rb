# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
KineApp::Application.initialize!

#To debug 
Rails.logger = Logger.new(STDOUT)

#Pour l'UTF8
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8