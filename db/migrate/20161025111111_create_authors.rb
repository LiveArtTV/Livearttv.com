# This migration comes from spree_static_content (originally 20081216193152)
class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table :spree_authors do |t|
      t.string :name
      t.text :content
      t.integer :year_of_birth
      t.integer :year_of_death
      t.integer :category
      t.string :slug
      t.string :foreign_link
      t.boolean :visible, default: true
      t.string :meta_title
      t.string :meta_keywords
      t.string :meta_description
      t.string :layout
      t.boolean :render_layout_as_partial, default: false
      t.boolean :show_in_sidebar, default: false, null: false

      t.timestamps null: false
    end
    add_index(:spree_authors, :slug)
    add_index(:spree_authors, :category)
  end

  def self.down
    drop_table :spree_authors
  end
end
