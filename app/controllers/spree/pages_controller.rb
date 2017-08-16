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

    def contact_artist
      title = Spree.t(:call_for_artist)
      @breadcrumbs = OpenStruct.new(name: title, title: title)
    end

    def contact_artist_send
      if params[:name].blank?
        MailingMailer.feedback_artist(msg_artist_params).deliver_now
      end
      respond_to do |format|
        format.html { redirect_to(pages_contact_artist_path, notice: 'Message was successfully sended.') }
        format.js{ render text: params[:name].blank? ? 'success' : 'failed' }
      end
    end

    def contact_us_send
      if params[:name].blank? # check bot. This params must be empty =)
        MailingMailer.feedback(msg_params).deliver
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

    def msg_artist_params
      params.require(:contact).permit(:name, :email, :link, :subject, :content, {files:[]})
    end
  end
end
