Deface::Override.new(virtual_path:  'spree/admin/products/_form',
                     name:          'add_description_short_to_product_form',
                     insert_bottom: '[data-hook="admin_product_form_slug"]',
                     partial:       'spree/admin/shared/description_short_product_form',
                     disabled:      false)