Deface::Override.new(virtual_path:  'spree/layouts/admin',
                     name:          'add_video_to_admin_tabs',
                     insert_bottom: '[data-hook="admin_tabs"]',
                     partial:       'spree/admin/shared/video_main_menu',
                     disabled:      false)