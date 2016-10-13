if Rails.env.staging? || Rails.env.production?
  Airbrake.configure do |config|
    config.host = 'https://errbit.sumatosoft.com'
    config.project_id = 1
    config.project_key = '373e74029be35128775a4aff9ffdb70e'
    config.ignore_environments = %w(development test)
    config.environment = Rails.env
    config.root_directory = Rails.root
    config.logger = Rails.logger
  end
end
