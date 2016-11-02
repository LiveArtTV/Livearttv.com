# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# Note: If a preference is set here it will be stored within the cache & database upon initialization.
#       Just removing an entry from this initializer will not make the preference value go away.
#       Instead you must either set a new value or remove entry, clear cache, and remove database entry.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'

Spree::AppConfiguration.class_eval do
  preference :company_title,   :string, default: ''
  preference :company_address, :string, default: ''
  preference :company_phone,   :string, default: ''
  preference :company_email,   :string, default: ''
end

Spree.config do |config|
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false
  config.logo = 'logo.png'
  config.company_title   = 'Elite Shopping'
  config.company_address = 'Warrent House, 221b Baker Street - London - United Kingdom'
  config.company_phone   = '(+84). 123 456 789'
  config.company_email   = 'info@eliteshopping.com'
end

Spree.user_class = "Spree::User"
