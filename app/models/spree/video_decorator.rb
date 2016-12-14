Spree::Video.class_eval do
  scope :orderby, -> (opt) { order(opt.is_a?(Array) && opt[1] ? {opt[0] => opt[1]} : opt) }
end