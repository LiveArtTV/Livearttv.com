class MailingMailer < ActionMailer::Base
  # default from: Spree::Config[:company_email]

  def feedback(params)
    @params = params
    @url = ActionMailer::Base.default_url_options[:host]
    # to = ActionMailer::Base.default[:from]
    if @params
      mail(to: Spree::Config[:company_email], from: "#{@params[:name]} <noreply@livearttv.com>", subject: @params[:subject], reply_to: @params[:email])
    end
  end

  def feedback_artist(params)
    @params = params
    if @params[:files]
      @params[:files].each do |file|
        attachments[file.original_filename] = File.open(file.path, 'rb'){|f| f.read}
    end
  end
    mail(to: Spree::Config[:company_email], from: "#{@params[:name]} <noreply@livearttv.com>", subject: @params[:subject] )
  end
end
