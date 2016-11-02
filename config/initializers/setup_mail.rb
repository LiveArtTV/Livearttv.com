ActionMailer::Base.smtp_settings = {
	address:              'smtp.mandrillapp.com',
	port:                 587,
	domain:               'sumatosoft.com',
	user_name:            'eliteshopping',
	password:             Spree::Chimpy::Config[:key],
	authentication:       :plain,
	enable_starttls_auto: true
}