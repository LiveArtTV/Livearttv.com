Spree::Video.class_eval do
  attr_accessor :author_id
  belongs_to :author, -> {where spree_videos: {watchable_type: 'Spree::Author'}}, class_name: 'Author', foreign_key: :watchable_id
  scope :orderby, -> (opt) { order(opt.is_a?(Array) && opt[1] ? {opt[0] => opt[1]} : opt) }
end