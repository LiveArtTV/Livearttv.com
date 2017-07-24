# == Schema Information
#
# Table name: spree_authors
#
#  id                       :integer          not null, primary key
#  name                     :string
#  content                  :text
#  year_of_birth            :integer
#  year_of_death            :integer
#  category                 :integer
#  slug                     :string
#  foreign_link             :string
#  visible                  :boolean          default(TRUE)
#  meta_title               :string
#  meta_keywords            :string
#  meta_description         :string
#  layout                   :string
#  render_layout_as_partial :boolean          default(FALSE)
#  show_in_sidebar          :boolean          default(FALSE), not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class Spree::Author < ActiveRecord::Base

  CATEGORY_ARTIST   = 1
  CATEGORY_SCULPTOR = 2

  enum category: {
      artist:   CATEGORY_ARTIST,
      sculptor: CATEGORY_SCULPTOR
  }

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :category, presence: true
  validates :slug, :content, presence: true
  validates :slug, uniqueness: true
  validates :foreign_link, uniqueness: true, allow_blank: true

  has_many :products
  has_many :author_images, -> { order 'position ASC' }, as: :viewable
  delegate_belongs_to :author_images
  alias_method :images, :author_images

  has_many :videos, -> { order 'position ASC' }, :as => :watchable
  has_many :taxons, through: :products

  scope :visible, -> { where(visible: true) }
  scope :header_links, -> { where(show_in_header: true).visible }
  scope :sidebar_links, -> { where(show_in_sidebar: true).visible }

  before_validation :fill_slug

  def description
    content
  end

  def fill_slug
    self.slug = name.gsub(/\s+/, '_').underscore
  end

  protected
  def ransackable_attributes(auth_object = nil)
    super & %w(name)
  end
end
