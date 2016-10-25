Deface::Override.new(virtual_path:  'spree/layouts/admin',
                     name:          'add_author_to_admin_tabs',
                     insert_bottom: '[data-hook="admin_tabs"]',
                     partial:       'spree/admin/shared/author_main_menu',
                     disabled:      false)

Deface::Override.new(virtual_path:  'spree/admin/products/_form',
                     name:          'add_author_to_product_form',
                     insert_bottom: '[data-hook="admin_product_form_option_types"]',
                     partial:       'spree/admin/shared/author_product_form',
                     disabled:      false)
