Spree::Taxon.class_eval do
  scope :show_on_home, -> {where show_on_home: true}
end