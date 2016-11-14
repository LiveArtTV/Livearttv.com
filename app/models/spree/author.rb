class Spree::Author < ActiveRecord::Base

  CATEGORY_ARTIST   = 1
  CATEGORY_SCULPTOR = 2

  enum category: {
      artist:   CATEGORY_ARTIST,
      sculptor: CATEGORY_SCULPTOR
  }

  validates :name, presence: true
  validates :category, presence: true
  validates :slug, :content, presence: true
  validates :slug, uniqueness: true
  validates :foreign_link, uniqueness: true, allow_blank: true

  has_many :products
  has_many :author_images, -> { order 'position ASC' }, as: :viewable
  delegate_belongs_to :author_images
  alias_method :images, :author_images

  scope :visible, -> { where(visible: true) }
  scope :header_links, -> { where(show_in_header: true).visible }
  scope :sidebar_links, -> { where(show_in_sidebar: true).visible }

end
