module Spree
  class PagesController < Spree::StoreController
    respond_to :html

    def contact_us
      title = Spree.t(:contact_us)
      @breadcrumbs = OpenStruct.new(name: title, title: title)
    end

    def auctions
      title = Spree.t(:auctions)
      @breadcrumbs = OpenStruct.new(name: title, title: title)
    end

    def contact_us_send
      if params[:name].blank? # check bot. This params must be empty =)
        MailingMailer.feedback(msg_params)
      end

      respond_to do |format|
        format.html{ render text: params[:name].blank? ? 'success' : 'failed' }
        format.js{ render text: params[:name].blank? ? 'success' : 'failed' }
      end
    end

     def about_us
      title = Spree.t(:about_us)
      @breadcrumbs = OpenStruct.new(name: title, title: title)
    end

    private

    def msg_params
      params.require(:contact).permit(:name, :email, :phone, :link, :subject, :content)
    end
  end
end
