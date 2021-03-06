Spree::Video.class_eval do
  attr_accessor :author_id
  belongs_to :author, -> {where spree_videos: {watchable_type: 'Spree::Author'}}, class_name: 'Author', foreign_key: :watchable_id
  scope :orderby, -> (opt) { order(opt.is_a?(Array) && opt[1] ? {opt[0] => opt[1]} : opt) }
  validates :youtube_ref, format: {with: /([\w-]+)(&.+)?$/, message: :incorrect_link, multiline: true}, if: Proc.new{|model| model.youtube_ref.present?}

  def embed_html(html5_config = {}, youtube_url_params = {})
#  if youtube_url_params.empty?
  #youtube_data.embed_html
  #else
    "<iframe width='560' height='315' src='//www.youtube.com/embed/#{youtube_ref}' frameborder='0' allowfullscreen></iframe>"
  #end
  end
end
