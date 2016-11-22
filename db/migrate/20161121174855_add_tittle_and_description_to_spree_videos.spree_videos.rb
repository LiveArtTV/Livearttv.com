# This migration comes from spree_videos (originally 20161121172707)
class AddTittleAndDescriptionToSpreeVideos < ActiveRecord::Migration
  def change
    add_column :spree_videos, :title,         :string, default: '', limit: 1024
    add_column :spree_videos, :description,   :string, default: '', limit: 4096
    add_column :spree_videos, :duration,      :integer, default: 0
    add_column :spree_videos, :views,         :integer, default: 0
    add_column :spree_videos, :likes,         :integer, default: 0
    add_column :spree_videos, :dislikes,      :integer, default: 0
    add_column :spree_videos, :comments,      :integer, default: 0
    add_column :spree_videos, :subscribers,   :integer, default: 0
    add_column :spree_videos, :thumbnail_url, :string, default: ''
    add_column :spree_videos, :show_on_home,  :boolean, default: false
    add_column :spree_videos, :stream,        :boolean, default: false
  end
end
