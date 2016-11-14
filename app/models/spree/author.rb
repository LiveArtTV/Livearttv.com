class Spree::Author < ActiveRecord::Base

  CATEGORY_ARTIST   = 1
  CATEGORY_SCULPTOR = 2

  enum category: {
      artist:   CATEGORY_ARTIST,
      sculptor: CATEGORY_SCULPTOR
  }

  validates :name, presence: true
  validates :category, presence: true
  validates :slug, :content, presence: true, if: :not_using_foreign_link?
  validates :layout, presence: true, if: :render_layout_as_partial?
  validates :slug, uniqueness: true, if: :not_using_foreign_link?
  validates :foreign_link, uniqueness: true, allow_blank: true

  has_many :products
  has_many :author_images, -> { order 'position ASC' }, as: :viewable
  delegate_belongs_to :author_images
  alias_method :images, :author_images

  scope :visible, -> { where(visible: true) }
  scope :header_links, -> { where(show_in_header: true).visible }
  scope :sidebar_links, -> { where(show_in_sidebar: true).visible }

  before_save :update_slug

  def link
    foreign_link.blank? ? slug : foreign_link
  end

  private

  def update_slug
    # Ensure that all slugs start with a slash.
    slug.prepend('/') if not_using_foreign_link? && !slug.start_with?('/')
  end

  def not_using_foreign_link?
    foreign_link.blank?
  end
end
