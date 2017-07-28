Spree::Taxon.class_eval do
  scope :show_on_home, -> {where show_on_home: true}
  has_many :authors, through: :products
end
