class MailingMailer < ActionMailer::Base
  # default from: Spree::Config[:company_email]

  def feedback(params)
    @params = params
    @url = ActionMailer::Base.default_url_options[:host]
    # to = ActionMailer::Base.default[:from]
    if @params
      mail(to: Spree::Config[:company_email], subject: @params[:subject], reply_to: @params[:email])
    end
  end

end
