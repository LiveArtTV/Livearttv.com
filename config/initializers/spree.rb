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
  preference :company_phone_tol,   :string, default: ''
  preference :company_email,   :string, default: ''
  preference :facebook, :string, default: ''
  preference :twitter, :string, default: ''
  preference :instagram, :string, default: ''
end

Spree.config do |config|
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false
  config.logo = 'logo02.png'
  config.company_title   = 'Elite Shopping'
  config.company_address = '157 Kimbles Road, Hawley, PA 18428'
  config.company_phone   = 'Office: 1-570-390-7800'
  config.company_phone_tol   = 'Toll Free 1-855-98-ELITE'
  config.company_email   = 'rostov-7@yandex.ru'
  config.show_raw_product_description = true
  config.checkout_zone   = 'United States'
  config.facebook = 'https://www.facebook.com/Live-Art-TV-1887238398266577'
  config.twitter = 'https://twitter.com/info_livearttv'
  config.instagram = 'https://www.instagram.com/livearttv/'
end

Spree.user_class = "Spree::User"

attachment_config = {
    s3_credentials: {
        access_key_id:     Rails.application.secrets.aws['access_key_id'],
        secret_access_key: Rails.application.secrets.aws['secret_access_key'],
        bucket:            Rails.application.secrets.aws['s3_bucket_name']
    },

    storage:        :s3,
    s3_headers:     { "Cache-Control" => "max-age=31557600" },
    s3_protocol:    'https',
    bucket:         Rails.application.secrets.aws['s3_bucket_name'],
    url:            ':s3_alias_url',
    s3_host_alias:  "dr7i20qo9w2ma.cloudfront.net",
    #
    # styles: {
    #     mini:     "48x48>",
    #     small:    "100x100>",
    #     product:  "240x240>",
    #     large:    "600x600>"
    # },
    #
    path:           '/:class/:id/:style/:basename.:extension',
    default_url:    '/:class/:id/:style/:basename.:extension',
    default_style:  'product'
}

[Spree::Image, Spree::AuthorImage].each do |model|
  attachment_config.each do |key, value|
    model.attachment_definitions[:attachment][key.to_sym] = value
  end
end unless Rails.env.development? || Rails.env.testing?

Spree::Image.attachment_definitions[:attachment][:styles].merge!(
    product476:  '476x476>',
    product1024: '1024x1024>'
)

Spree::PermittedAttributes.user_attributes << [:first_name, :last_name]
Spree::PermittedAttributes.taxon_attributes << [:show_on_home]
Spree::PermittedAttributes.product_attributes << [:description_short]
Spree::Taxon.attachment_definitions[:icon][:styles].merge!(
    home:  '270x170#'
)

Spree.config do |config|
  config.products_per_page = 50
end
